
CREATE TABLE "orders" (
    "row_id" numeric   NOT NULL,
    "order_id" varchar(10)   NOT NULL,
    "item_id" varchar(10)   NOT NULL,
    "cust_id" numeric   NOT NULL,
    "add_id" numeric   NOT NULL,
    "created_at" datetime   NOT NULL,
    "quantity" numeric   NOT NULL,
    "delivery" boolean   NOT NULL,
    CONSTRAINT "pk_orders" PRIMARY KEY (
        "row_id"
     )
);

CREATE TABLE "customers" (
    "cust_id" numeric   NOT NULL,
    "cust_firstname" varchar(50)   NOT NULL,
    "cust_lastname" varchar(50)   NOT NULL,
    CONSTRAINT "pk_customers" PRIMARY KEY (
        "cust_id"
     )
);

CREATE TABLE "address" (
    "add_id" numeric   NOT NULL,
    "delivery_address1" varchar(200)   NOT NULL,
    "delivery_address2" varchar(200)   NULL,
    "delivery_city" varchar(50)   NOT NULL,
    "delivery_zipcode" varchr(50)   NOT NULL,
    CONSTRAINT "pk_address" PRIMARY KEY (
        "add_id"
     )
);

CREATE TABLE "item" (
    "item_id" numeric   NOT NULL,
    "sku" varchar(20)   NOT NULL,
    "item_name" varchar(100)   NOT NULL,
    "item_cat" varchar(100)   NOT NULL,
    "item_size" varchar(10)   NOT NULL,
    "item_price" numeric(10,2)   NOT NULL,
    CONSTRAINT "pk_item" PRIMARY KEY (
        "item_id"
     )
);

CREATE TABLE "recipe" (
    "row_id" varchar(20)   NOT NULL,
    "recipe_id" varchar(20)   NOT NULL,
    "ing_id" varcgar(10)   NOT NULL,
    "quantity" numeric(10)   NOT NULL,
    CONSTRAINT "pk_recipe" PRIMARY KEY (
        "row_id"
     )
);

CREATE TABLE "ingredient" (
    "ing_id" varchar(10)   NOT NULL,
    "ing_name" varchar(200)   NOT NULL,
    "ing_weight" numeric   NOT NULL,
    CONSTRAINT "pk_ingredient" PRIMARY KEY (
        "ing_id"
     )
);

CREATE TABLE "inventory" (
    "inv_id" numeric   NOT NULL,
    "item_id" varchar(10)   NOT NULL,
    "quantity" numeric   NOT NULL,
    CONSTRAINT "pk_inventory" PRIMARY KEY (
        "inv_id"
     )
);

CREATE TABLE "staff" (
    "staff_id" varchar(20)   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "position" varchar(100)   NOT NULL,
    "hourly_rate" numeric(5,2)   NOT NULL,
    CONSTRAINT "pk_staff" PRIMARY KEY (
        "staff_id"
     )
);

CREATE TABLE "shift" (
    "shift_id" varchar(20)   NOT NULL,
    "day_of_week" varchar(10)   NOT NULL,
    "start_time" time   NOT NULL,
    "end_time" time   NOT NULL,
    CONSTRAINT "pk_shift" PRIMARY KEY (
        "shift_id"
     )
);

CREATE TABLE "rotation" (
    "row_id" numeric   NOT NULL,
    "rota_id" varchar(20)   NOT NULL,
    "date" datetime   NOT NULL,
    "shift_id" varchar(20)   NOT NULL,
    "staff_id" varchar(20)   NOT NULL,
    CONSTRAINT "pk_rotation" PRIMARY KEY (
        "row_id"
     )
);

ALTER TABLE "customers" ADD CONSTRAINT "fk_customers_cust_id" FOREIGN KEY("cust_id")
REFERENCES "orders" ("cust_id");

ALTER TABLE "address" ADD CONSTRAINT "fk_address_add_id" FOREIGN KEY("add_id")
REFERENCES "orders" ("add_id");

ALTER TABLE "item" ADD CONSTRAINT "fk_item_item_id" FOREIGN KEY("item_id")
REFERENCES "orders" ("item_id");

ALTER TABLE "recipe" ADD CONSTRAINT "fk_recipe_recipe_id" FOREIGN KEY("recipe_id")
REFERENCES "item" ("sku");

ALTER TABLE "ingredient" ADD CONSTRAINT "fk_ingredient_ing_id" FOREIGN KEY("ing_id")
REFERENCES "recipe" ("ing_id");

ALTER TABLE "inventory" ADD CONSTRAINT "fk_inventory_item_id" FOREIGN KEY("item_id")
REFERENCES "recipe" ("ing_id");

ALTER TABLE "staff" ADD CONSTRAINT "fk_staff_staff_id" FOREIGN KEY("staff_id")
REFERENCES "rotation" ("staff_id");

ALTER TABLE "shift" ADD CONSTRAINT "fk_shift_shift_id" FOREIGN KEY("shift_id")
REFERENCES "rotation" ("shift_id");

ALTER TABLE "rotation" ADD CONSTRAINT "fk_rotation_date" FOREIGN KEY("date")
REFERENCES "orders" ("created_at");

