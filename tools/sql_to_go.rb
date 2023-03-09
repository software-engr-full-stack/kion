#!/usr/bin/env ruby

require 'active_support/core_ext/string'

class SqlToGo
  CREATE_TABLE_RX = /CREATE TABLE IF NOT EXISTS (\w+) \(/
  TYPE_TABLE = {
    INT: 'int',
    INTEGER: 'int',
    FLOAT: 'float32',
    VARCHAR: 'string',
    DATETIME: 'time.Time'
  }.freeze

  private_constant :CREATE_TABLE_RX, :TYPE_TABLE

  def initialize(input_file)
    table_name, fields = parse_input input_file

    gofy table_name, fields
  end

  private

  def parse_input(input_file)
    table_name = nil
    fields = []
    File.foreach(input_file) do |line|
      rxm = line.match(CREATE_TABLE_RX)
      table_name = rxm.captures[0] if rxm

      if table_name and line !~ CREATE_TABLE_RX
        break if line =~ /^\A \s* \) \s* ; \s* \z/x

        fields.push line
      end
    end

    raise '... table name not found' if !table_name

    return table_name.singularize.camelize, fields
  end

  def gofy(table_name, fields)
    puts "type #{table_name} struct {"
    fields.each do |fd|
      next if fd =~ /\A \s* CONSTRAINT/

      fd = fd.strip
      words = fd.split(/\s+/)

      fd_name = words.first
      fd_type = words[1].sub(/\(.*\z/, '').upcase

      go_name = fd_name == 'id' ? 'ID' : fd_name.camelize
      go_type = TYPE_TABLE[fd_type.to_sym]
      raise "... unsupported type '#{fd_type}': '#{fd}'" if !go_type

      puts %{    #{go_name} #{go_type} `json:"#{fd_name.camelize(:lower)}"`}
    end
    puts '}'
  end
end

SqlToGo.new(*ARGV)
