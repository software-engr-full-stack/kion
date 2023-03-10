package mysql

import (
    "fmt"

    "database/sql"

    "github.com/software-engr-full-stack/kion/pkg/models"
)

const customersTableName = "customers"
const costsTableName = "costs"
const complianceScoresTableName = "compliance_scores"

type CustomerModel struct {
    DB *sql.DB
}

func (m *CustomerModel) Validate() error {
    if m.DB == nil {
        return fmt.Errorf("DB must not be nil")
    }

    return nil
}

func (m *CustomerModel) AllWithChildren() ([]*models.Customer, error) {
    tx, err := m.DB.Begin()
    if err != nil {
        return nil, err
    }

    customers, err := getCustomers(tx)
    if err != nil {
        return nil, err
    }

    for _, cust := range customers {
        costs, err := getCosts(tx, cust.ID) //nolint:govet,shadow
        if err != nil {
            return nil, err
        }
        cust.Costs = costs

        complianceScores, err := getComplianceScores(tx, cust.ID)
        if err != nil {
            return nil, err
        }
        cust.ComplianceScores = complianceScores
    }

    err = tx.Commit()
    if err != nil {
        return nil, err
    }

    return customers, nil
}

func getCustomers(tx *sql.Tx) ([]*models.Customer, error) {
    stmt := fmt.Sprintf(
        `SELECT id, name, created, updated FROM %s
        ORDER BY created`,
        customersTableName,
    )
    rows, err := tx.Query(stmt)
    if err != nil {
        txrErr := tx.Rollback()
        if txrErr != nil {
            return nil, fmt.Errorf(
                "transaction rollback error: %#v, query error: %#v", txrErr.Error(), err.Error(),
            )
        }
        return nil, err
    }
    defer rows.Close()

    customers := []*models.Customer{}
    for rows.Next() {
        rec := &models.Customer{}
        err = rows.Scan(&rec.ID, &rec.Name, &rec.Created, &rec.Updated)
        if err != nil {
            return nil, err
        }
        customers = append(customers, rec)
    }
    if rerr := rows.Err(); rerr != nil {
        return nil, rerr
    }

    return customers, nil
}

func getCosts(tx *sql.Tx, custID int) ([]*models.Cost, error) {
    stmt := fmt.Sprintf( //nolint:gosec,G201
        `SELECT id, customer_id, month_code, amount, created, updated FROM %s
        WHERE customer_id = %d`,
        costsTableName,
        custID,
    )
    rows, err := tx.Query(stmt)
    if err != nil {
        txrErr := tx.Rollback()
        if txrErr != nil {
            return nil, fmt.Errorf(
                "transaction rollback error: %#v, query error: %#v", txrErr.Error(), err.Error(),
            )
        }
        return nil, err
    }
    defer rows.Close()

    costs := []*models.Cost{}
    for rows.Next() {
        rec := &models.Cost{}
        err = rows.Scan(&rec.ID, &rec.CustomerID, &rec.MonthCode, &rec.Amount, &rec.Created, &rec.Updated)
        if err != nil {
            return nil, err
        }
        costs = append(costs, rec)
    }
    if rerr := rows.Err(); rerr != nil {
        return nil, rerr
    }

    return costs, nil
}

func getComplianceScores(tx *sql.Tx, custID int) ([]*models.ComplianceScore, error) {
    stmt := fmt.Sprintf( //nolint:gosec,G201
        `SELECT id, customer_id, total_checks, completed, created, updated FROM %s
        WHERE customer_id = %d`,
        complianceScoresTableName,
        custID,
    )
    rows, err := tx.Query(stmt)
    if err != nil {
        txrErr := tx.Rollback()
        if txrErr != nil {
            return nil, fmt.Errorf(
                "transaction rollback error: %#v, query error: %#v", txrErr.Error(), err.Error(),
            )
        }
        return nil, err
    }

    complianceScores := []*models.ComplianceScore{}
    for rows.Next() {
        rec := &models.ComplianceScore{}
        err = rows.Scan(&rec.ID, &rec.CustomerID, &rec.TotalChecks, &rec.Completed, &rec.Created, &rec.Updated)
        if err != nil {
            return nil, err
        }
        complianceScores = append(complianceScores, rec)
    }
    if rerr := rows.Err(); rerr != nil {
        return nil, rerr
    }
    return complianceScores, nil
}
