CREATE TABLE "usuarios" (
  "id" integer PRIMARY KEY,
  "nombre" varchar,
  "email" varchar,
  "fecha_registro" timestamp,
  "username" varchar,
  "password" varchar
);

CREATE TABLE "direcciones" (
  "id" integer PRIMARY KEY,
  "usuario_id" integer,
  "calle" varchar,
  "ciudad" varchar,
  "estado" varchar,
  "pais" varchar
);

CREATE TABLE "telefonos" (
  "id" integer PRIMARY KEY,
  "usuario_id" integer,
  "numero_telefono" varchar
);

CREATE TABLE "experiencia_laboral" (
  "id" integer PRIMARY KEY,
  "usuario_id" integer,
  "empresa" varchar,
  "puesto" varchar,
  "fecha_inicio" date,
  "fecha_fin" date,
  "responsabilidades" text
);

COMMENT ON COLUMN "usuarios"."password" IS 'Hashed user password';

ALTER TABLE "direcciones" ADD FOREIGN KEY ("usuario_id") REFERENCES "usuarios" ("id");

ALTER TABLE "telefonos" ADD FOREIGN KEY ("usuario_id") REFERENCES "usuarios" ("id");

ALTER TABLE "experiencia_laboral" ADD FOREIGN KEY ("usuario_id") REFERENCES "usuarios" ("id");
