#!/usr/bin/env ruby

class FakeData
  def initialize(*companies)
    companies.each.with_index do |cmp, ix|
      sql = <<~SQLTEXT
        -- Switch to using the `kion` database.
        USE kion;

        SET @cmp_id = (SELECT id FROM customers WHERE name = '#{cmp}');

        -- Add some dummy records.
      SQLTEXT

      12.times do |num|
        month_code = format '%02d', num
        rnd = rand(80..500)
        dec = rand(0..99)
        sql += <<~SQLTEXT
          INSERT INTO costs (customer_id, month_code, amount, created, updated) VALUES (
            @cmp_id,
            '#{month_code}',
            #{rnd}.#{dec},
            UTC_TIMESTAMP(),
            UTC_TIMESTAMP()
          );
        SQLTEXT

        file = "1#{ix}_costs.sql"
        File.write file, sql
      end
    end
  end
end

FakeData.new 'UPS', 'NASA', 'Indeed', 'ManTech'
