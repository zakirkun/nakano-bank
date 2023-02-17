postgres:
	docker run --name simple-bank-db -e POSTGRES_PASSWORD=Nakano@Miku! -e POSTGRES_USER=nakano -e POSTGRES_DB=simple_bank -p 5432:5432 -d postgres:12-alpine3.17

migrateup:
	migrate -path db/migration -database "postgresql://nakano:Nakano@Miku!@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://nakano:Nakano@Miku!@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY : postgres migrateup migratedown sqlc