//
//  File.swift
//
//
//  Created by Tibor Bodecs on 07/03/2024.
//

import SQLKit

public protocol DatabaseQueryDelete: DatabaseQueryInterface {

    static func delete(
        filter: DatabaseFilter<Row.ColumnNames>,
        on db: Database
    ) async throws
}

extension DatabaseQueryDelete {

    public static func delete(
        filter: DatabaseFilter<Row.ColumnNames>,
        on db: Database
    ) async throws {
        try await db.run { sql in
            try await sql
                .delete(from: Row.tableName)
                .applyFilter(filter)
                .run()
        }
    }
}