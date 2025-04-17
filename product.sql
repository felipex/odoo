--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: product_attr_exclusion_value_ids_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_attr_exclusion_value_ids_rel (
    product_template_attribute_exclusion_id integer NOT NULL,
    product_template_attribute_value_id integer NOT NULL
);


ALTER TABLE public.product_attr_exclusion_value_ids_rel OWNER TO felipe;

--
-- Name: TABLE product_attr_exclusion_value_ids_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_attr_exclusion_value_ids_rel IS 'RELATION BETWEEN product_template_attribute_exclusion AND product_template_attribute_value';


--
-- Name: product_attribute; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_attribute (
    id integer NOT NULL,
    sequence integer,
    create_uid integer,
    write_uid integer,
    create_variant character varying NOT NULL,
    display_type character varying NOT NULL,
    name jsonb NOT NULL,
    active boolean,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    CONSTRAINT product_attribute_check_multi_checkbox_no_variant CHECK ((((display_type)::text <> 'multi'::text) OR ((create_variant)::text = 'no_variant'::text)))
);


ALTER TABLE public.product_attribute OWNER TO felipe;

--
-- Name: TABLE product_attribute; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_attribute IS 'Product Attribute';


--
-- Name: COLUMN product_attribute.sequence; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute.sequence IS 'Sequence';


--
-- Name: COLUMN product_attribute.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute.create_uid IS 'Created by';


--
-- Name: COLUMN product_attribute.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_attribute.create_variant; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute.create_variant IS 'Variant Creation';


--
-- Name: COLUMN product_attribute.display_type; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute.display_type IS 'Display Type';


--
-- Name: COLUMN product_attribute.name; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute.name IS 'Attribute';


--
-- Name: COLUMN product_attribute.active; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute.active IS 'Active';


--
-- Name: COLUMN product_attribute.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute.create_date IS 'Created on';


--
-- Name: COLUMN product_attribute.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute.write_date IS 'Last Updated on';


--
-- Name: CONSTRAINT product_attribute_check_multi_checkbox_no_variant ON product_attribute; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON CONSTRAINT product_attribute_check_multi_checkbox_no_variant ON public.product_attribute IS 'CHECK(display_type != ''multi'' OR create_variant = ''no_variant'')';


--
-- Name: product_attribute_custom_value; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_attribute_custom_value (
    id integer NOT NULL,
    custom_product_template_attribute_value_id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    custom_value character varying,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    sale_order_line_id integer,
    pos_order_line_id integer
);


ALTER TABLE public.product_attribute_custom_value OWNER TO felipe;

--
-- Name: TABLE product_attribute_custom_value; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_attribute_custom_value IS 'Product Attribute Custom Value';


--
-- Name: COLUMN product_attribute_custom_value.custom_product_template_attribute_value_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_custom_value.custom_product_template_attribute_value_id IS 'Attribute Value';


--
-- Name: COLUMN product_attribute_custom_value.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_custom_value.create_uid IS 'Created by';


--
-- Name: COLUMN product_attribute_custom_value.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_custom_value.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_attribute_custom_value.custom_value; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_custom_value.custom_value IS 'Custom Value';


--
-- Name: COLUMN product_attribute_custom_value.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_custom_value.create_date IS 'Created on';


--
-- Name: COLUMN product_attribute_custom_value.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_custom_value.write_date IS 'Last Updated on';


--
-- Name: COLUMN product_attribute_custom_value.sale_order_line_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_custom_value.sale_order_line_id IS 'Sales Order Line';


--
-- Name: COLUMN product_attribute_custom_value.pos_order_line_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_custom_value.pos_order_line_id IS 'PoS Order Line';


--
-- Name: product_attribute_custom_value_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_attribute_custom_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_attribute_custom_value_id_seq OWNER TO felipe;

--
-- Name: product_attribute_custom_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_attribute_custom_value_id_seq OWNED BY public.product_attribute_custom_value.id;


--
-- Name: product_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_attribute_id_seq OWNER TO felipe;

--
-- Name: product_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_attribute_id_seq OWNED BY public.product_attribute.id;


--
-- Name: product_attribute_product_template_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_attribute_product_template_rel (
    product_attribute_id integer NOT NULL,
    product_template_id integer NOT NULL
);


ALTER TABLE public.product_attribute_product_template_rel OWNER TO felipe;

--
-- Name: TABLE product_attribute_product_template_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_attribute_product_template_rel IS 'RELATION BETWEEN product_attribute AND product_template';


--
-- Name: product_attribute_value; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_attribute_value (
    id integer NOT NULL,
    sequence integer,
    attribute_id integer NOT NULL,
    color integer,
    create_uid integer,
    write_uid integer,
    html_color character varying,
    name jsonb NOT NULL,
    is_custom boolean,
    active boolean,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    default_extra_price double precision
);


ALTER TABLE public.product_attribute_value OWNER TO felipe;

--
-- Name: TABLE product_attribute_value; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_attribute_value IS 'Attribute Value';


--
-- Name: COLUMN product_attribute_value.sequence; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_value.sequence IS 'Sequence';


--
-- Name: COLUMN product_attribute_value.attribute_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_value.attribute_id IS 'Attribute';


--
-- Name: COLUMN product_attribute_value.color; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_value.color IS 'Color Index';


--
-- Name: COLUMN product_attribute_value.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_value.create_uid IS 'Created by';


--
-- Name: COLUMN product_attribute_value.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_value.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_attribute_value.html_color; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_value.html_color IS 'Color';


--
-- Name: COLUMN product_attribute_value.name; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_value.name IS 'Value';


--
-- Name: COLUMN product_attribute_value.is_custom; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_value.is_custom IS 'Free text';


--
-- Name: COLUMN product_attribute_value.active; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_value.active IS 'Active';


--
-- Name: COLUMN product_attribute_value.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_value.create_date IS 'Created on';


--
-- Name: COLUMN product_attribute_value.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_value.write_date IS 'Last Updated on';


--
-- Name: COLUMN product_attribute_value.default_extra_price; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_attribute_value.default_extra_price IS 'Default Extra Price';


--
-- Name: product_attribute_value_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_attribute_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_attribute_value_id_seq OWNER TO felipe;

--
-- Name: product_attribute_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_attribute_value_id_seq OWNED BY public.product_attribute_value.id;


--
-- Name: product_attribute_value_product_template_attribute_line_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_attribute_value_product_template_attribute_line_rel (
    product_attribute_value_id integer NOT NULL,
    product_template_attribute_line_id integer NOT NULL
);


ALTER TABLE public.product_attribute_value_product_template_attribute_line_rel OWNER TO felipe;

--
-- Name: TABLE product_attribute_value_product_template_attribute_line_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_attribute_value_product_template_attribute_line_rel IS 'RELATION BETWEEN product_attribute_value AND product_template_attribute_line';


--
-- Name: product_category; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_category (
    id integer NOT NULL,
    parent_id integer,
    create_uid integer,
    write_uid integer,
    name character varying NOT NULL,
    complete_name character varying,
    parent_path character varying,
    product_properties_definition jsonb,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    property_account_income_categ_id jsonb,
    property_account_expense_categ_id jsonb,
    property_account_downpayment_categ_id jsonb,
    removal_strategy_id integer,
    packaging_reserve_method character varying,
    property_valuation jsonb,
    property_cost_method jsonb,
    property_stock_journal jsonb,
    property_stock_account_input_categ_id jsonb,
    property_stock_account_output_categ_id jsonb,
    property_stock_valuation_account_id jsonb,
    property_stock_account_production_cost_id jsonb
);


ALTER TABLE public.product_category OWNER TO felipe;

--
-- Name: TABLE product_category; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_category IS 'Product Category';


--
-- Name: COLUMN product_category.parent_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.parent_id IS 'Parent Category';


--
-- Name: COLUMN product_category.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.create_uid IS 'Created by';


--
-- Name: COLUMN product_category.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_category.name; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.name IS 'Name';


--
-- Name: COLUMN product_category.complete_name; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.complete_name IS 'Complete Name';


--
-- Name: COLUMN product_category.parent_path; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.parent_path IS 'Parent Path';


--
-- Name: COLUMN product_category.product_properties_definition; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.product_properties_definition IS 'Product Properties';


--
-- Name: COLUMN product_category.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.create_date IS 'Created on';


--
-- Name: COLUMN product_category.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.write_date IS 'Last Updated on';


--
-- Name: COLUMN product_category.property_account_income_categ_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.property_account_income_categ_id IS 'Income Account';


--
-- Name: COLUMN product_category.property_account_expense_categ_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.property_account_expense_categ_id IS 'Expense Account';


--
-- Name: COLUMN product_category.property_account_downpayment_categ_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.property_account_downpayment_categ_id IS 'Downpayment Account';


--
-- Name: COLUMN product_category.removal_strategy_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.removal_strategy_id IS 'Force Removal Strategy';


--
-- Name: COLUMN product_category.packaging_reserve_method; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.packaging_reserve_method IS 'Reserve Packagings';


--
-- Name: COLUMN product_category.property_valuation; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.property_valuation IS 'Inventory Valuation';


--
-- Name: COLUMN product_category.property_cost_method; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.property_cost_method IS 'Costing Method';


--
-- Name: COLUMN product_category.property_stock_journal; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.property_stock_journal IS 'Stock Journal';


--
-- Name: COLUMN product_category.property_stock_account_input_categ_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.property_stock_account_input_categ_id IS 'Stock Input Account';


--
-- Name: COLUMN product_category.property_stock_account_output_categ_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.property_stock_account_output_categ_id IS 'Stock Output Account';


--
-- Name: COLUMN product_category.property_stock_valuation_account_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.property_stock_valuation_account_id IS 'Stock Valuation Account';


--
-- Name: COLUMN product_category.property_stock_account_production_cost_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_category.property_stock_account_production_cost_id IS 'Production Account';


--
-- Name: product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_category_id_seq OWNER TO felipe;

--
-- Name: product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_category_id_seq OWNED BY public.product_category.id;


--
-- Name: product_combo; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_combo (
    id integer NOT NULL,
    sequence integer,
    company_id integer,
    create_uid integer,
    write_uid integer,
    name character varying NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone
);


ALTER TABLE public.product_combo OWNER TO felipe;

--
-- Name: TABLE product_combo; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_combo IS 'Product Combo';


--
-- Name: COLUMN product_combo.sequence; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo.sequence IS 'Sequence';


--
-- Name: COLUMN product_combo.company_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo.company_id IS 'Company';


--
-- Name: COLUMN product_combo.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo.create_uid IS 'Created by';


--
-- Name: COLUMN product_combo.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_combo.name; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo.name IS 'Name';


--
-- Name: COLUMN product_combo.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo.create_date IS 'Created on';


--
-- Name: COLUMN product_combo.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo.write_date IS 'Last Updated on';


--
-- Name: product_combo_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_combo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_combo_id_seq OWNER TO felipe;

--
-- Name: product_combo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_combo_id_seq OWNED BY public.product_combo.id;


--
-- Name: product_combo_item; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_combo_item (
    id integer NOT NULL,
    company_id integer,
    combo_id integer NOT NULL,
    product_id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    extra_price numeric,
    create_date timestamp without time zone,
    write_date timestamp without time zone
);


ALTER TABLE public.product_combo_item OWNER TO felipe;

--
-- Name: TABLE product_combo_item; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_combo_item IS 'Product Combo Item';


--
-- Name: COLUMN product_combo_item.company_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo_item.company_id IS 'Company';


--
-- Name: COLUMN product_combo_item.combo_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo_item.combo_id IS 'Combo';


--
-- Name: COLUMN product_combo_item.product_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo_item.product_id IS 'Product';


--
-- Name: COLUMN product_combo_item.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo_item.create_uid IS 'Created by';


--
-- Name: COLUMN product_combo_item.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo_item.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_combo_item.extra_price; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo_item.extra_price IS 'Extra Price';


--
-- Name: COLUMN product_combo_item.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo_item.create_date IS 'Created on';


--
-- Name: COLUMN product_combo_item.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_combo_item.write_date IS 'Last Updated on';


--
-- Name: product_combo_item_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_combo_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_combo_item_id_seq OWNER TO felipe;

--
-- Name: product_combo_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_combo_item_id_seq OWNED BY public.product_combo_item.id;


--
-- Name: product_combo_product_template_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_combo_product_template_rel (
    product_template_id integer NOT NULL,
    product_combo_id integer NOT NULL
);


ALTER TABLE public.product_combo_product_template_rel OWNER TO felipe;

--
-- Name: TABLE product_combo_product_template_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_combo_product_template_rel IS 'RELATION BETWEEN product_template AND product_combo';


--
-- Name: product_document; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_document (
    id integer NOT NULL,
    ir_attachment_id integer NOT NULL,
    sequence integer,
    create_uid integer,
    write_uid integer,
    active boolean,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    attached_on_sale character varying NOT NULL,
    attached_on_mrp character varying NOT NULL
);


ALTER TABLE public.product_document OWNER TO felipe;

--
-- Name: TABLE product_document; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_document IS 'Product Document';


--
-- Name: COLUMN product_document.ir_attachment_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_document.ir_attachment_id IS 'Related attachment';


--
-- Name: COLUMN product_document.sequence; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_document.sequence IS 'Sequence';


--
-- Name: COLUMN product_document.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_document.create_uid IS 'Created by';


--
-- Name: COLUMN product_document.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_document.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_document.active; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_document.active IS 'Active';


--
-- Name: COLUMN product_document.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_document.create_date IS 'Created on';


--
-- Name: COLUMN product_document.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_document.write_date IS 'Last Updated on';


--
-- Name: COLUMN product_document.attached_on_sale; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_document.attached_on_sale IS 'Sale : Visible at';


--
-- Name: COLUMN product_document.attached_on_mrp; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_document.attached_on_mrp IS 'MRP : Visible at';


--
-- Name: product_document_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_document_id_seq OWNER TO felipe;

--
-- Name: product_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_document_id_seq OWNED BY public.product_document.id;


--
-- Name: product_document_sale_pdf_form_field_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_document_sale_pdf_form_field_rel (
    product_document_id integer NOT NULL,
    sale_pdf_form_field_id integer NOT NULL
);


ALTER TABLE public.product_document_sale_pdf_form_field_rel OWNER TO felipe;

--
-- Name: TABLE product_document_sale_pdf_form_field_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_document_sale_pdf_form_field_rel IS 'RELATION BETWEEN product_document AND sale_pdf_form_field';


--
-- Name: product_label_layout; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_label_layout (
    id integer NOT NULL,
    custom_quantity integer NOT NULL,
    pricelist_id integer,
    create_uid integer,
    write_uid integer,
    print_format character varying NOT NULL,
    extra_html text,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    move_quantity character varying NOT NULL
);


ALTER TABLE public.product_label_layout OWNER TO felipe;

--
-- Name: TABLE product_label_layout; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_label_layout IS 'Choose the sheet layout to print the labels';


--
-- Name: COLUMN product_label_layout.custom_quantity; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_label_layout.custom_quantity IS 'Quantity';


--
-- Name: COLUMN product_label_layout.pricelist_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_label_layout.pricelist_id IS 'Pricelist';


--
-- Name: COLUMN product_label_layout.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_label_layout.create_uid IS 'Created by';


--
-- Name: COLUMN product_label_layout.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_label_layout.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_label_layout.print_format; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_label_layout.print_format IS 'Format';


--
-- Name: COLUMN product_label_layout.extra_html; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_label_layout.extra_html IS 'Extra Content';


--
-- Name: COLUMN product_label_layout.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_label_layout.create_date IS 'Created on';


--
-- Name: COLUMN product_label_layout.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_label_layout.write_date IS 'Last Updated on';


--
-- Name: COLUMN product_label_layout.move_quantity; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_label_layout.move_quantity IS 'Quantity to print';


--
-- Name: product_label_layout_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_label_layout_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_label_layout_id_seq OWNER TO felipe;

--
-- Name: product_label_layout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_label_layout_id_seq OWNED BY public.product_label_layout.id;


--
-- Name: product_label_layout_product_product_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_label_layout_product_product_rel (
    product_label_layout_id integer NOT NULL,
    product_product_id integer NOT NULL
);


ALTER TABLE public.product_label_layout_product_product_rel OWNER TO felipe;

--
-- Name: TABLE product_label_layout_product_product_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_label_layout_product_product_rel IS 'RELATION BETWEEN product_label_layout AND product_product';


--
-- Name: product_label_layout_product_template_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_label_layout_product_template_rel (
    product_label_layout_id integer NOT NULL,
    product_template_id integer NOT NULL
);


ALTER TABLE public.product_label_layout_product_template_rel OWNER TO felipe;

--
-- Name: TABLE product_label_layout_product_template_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_label_layout_product_template_rel IS 'RELATION BETWEEN product_label_layout AND product_template';


--
-- Name: product_label_layout_stock_move_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_label_layout_stock_move_rel (
    product_label_layout_id integer NOT NULL,
    stock_move_id integer NOT NULL
);


ALTER TABLE public.product_label_layout_stock_move_rel OWNER TO felipe;

--
-- Name: TABLE product_label_layout_stock_move_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_label_layout_stock_move_rel IS 'RELATION BETWEEN product_label_layout AND stock_move';


--
-- Name: product_optional_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_optional_rel (
    src_id integer NOT NULL,
    dest_id integer NOT NULL
);


ALTER TABLE public.product_optional_rel OWNER TO felipe;

--
-- Name: TABLE product_optional_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_optional_rel IS 'RELATION BETWEEN product_template AND product_template';


--
-- Name: product_packaging; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_packaging (
    id integer NOT NULL,
    sequence integer,
    product_id integer NOT NULL,
    company_id integer,
    create_uid integer,
    write_uid integer,
    name character varying NOT NULL,
    barcode character varying,
    qty numeric,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    sales boolean,
    package_type_id integer,
    CONSTRAINT product_packaging_positive_qty CHECK ((qty > (0)::numeric))
);


ALTER TABLE public.product_packaging OWNER TO felipe;

--
-- Name: TABLE product_packaging; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_packaging IS 'Product Packaging';


--
-- Name: COLUMN product_packaging.sequence; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_packaging.sequence IS 'Sequence';


--
-- Name: COLUMN product_packaging.product_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_packaging.product_id IS 'Product';


--
-- Name: COLUMN product_packaging.company_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_packaging.company_id IS 'Company';


--
-- Name: COLUMN product_packaging.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_packaging.create_uid IS 'Created by';


--
-- Name: COLUMN product_packaging.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_packaging.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_packaging.name; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_packaging.name IS 'Product Packaging';


--
-- Name: COLUMN product_packaging.barcode; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_packaging.barcode IS 'Barcode';


--
-- Name: COLUMN product_packaging.qty; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_packaging.qty IS 'Contained Quantity';


--
-- Name: COLUMN product_packaging.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_packaging.create_date IS 'Created on';


--
-- Name: COLUMN product_packaging.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_packaging.write_date IS 'Last Updated on';


--
-- Name: COLUMN product_packaging.sales; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_packaging.sales IS 'Sales';


--
-- Name: COLUMN product_packaging.package_type_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_packaging.package_type_id IS 'Package Type';


--
-- Name: CONSTRAINT product_packaging_positive_qty ON product_packaging; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON CONSTRAINT product_packaging_positive_qty ON public.product_packaging IS 'CHECK(qty > 0)';


--
-- Name: product_packaging_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_packaging_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_packaging_id_seq OWNER TO felipe;

--
-- Name: product_packaging_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_packaging_id_seq OWNED BY public.product_packaging.id;


--
-- Name: product_pricelist; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_pricelist (
    id integer NOT NULL,
    sequence integer,
    currency_id integer NOT NULL,
    company_id integer,
    create_uid integer,
    write_uid integer,
    name jsonb NOT NULL,
    active boolean,
    create_date timestamp without time zone,
    write_date timestamp without time zone
);


ALTER TABLE public.product_pricelist OWNER TO felipe;

--
-- Name: TABLE product_pricelist; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_pricelist IS 'Pricelist';


--
-- Name: COLUMN product_pricelist.sequence; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist.sequence IS 'Sequence';


--
-- Name: COLUMN product_pricelist.currency_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist.currency_id IS 'Currency';


--
-- Name: COLUMN product_pricelist.company_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist.company_id IS 'Company';


--
-- Name: COLUMN product_pricelist.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist.create_uid IS 'Created by';


--
-- Name: COLUMN product_pricelist.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_pricelist.name; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist.name IS 'Pricelist Name';


--
-- Name: COLUMN product_pricelist.active; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist.active IS 'Active';


--
-- Name: COLUMN product_pricelist.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist.create_date IS 'Created on';


--
-- Name: COLUMN product_pricelist.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist.write_date IS 'Last Updated on';


--
-- Name: product_pricelist_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_pricelist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_pricelist_id_seq OWNER TO felipe;

--
-- Name: product_pricelist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_pricelist_id_seq OWNED BY public.product_pricelist.id;


--
-- Name: product_pricelist_item; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_pricelist_item (
    id integer NOT NULL,
    pricelist_id integer NOT NULL,
    company_id integer,
    currency_id integer,
    categ_id integer,
    product_tmpl_id integer,
    product_id integer,
    base_pricelist_id integer,
    create_uid integer,
    write_uid integer,
    applied_on character varying NOT NULL,
    display_applied_on character varying NOT NULL,
    base character varying NOT NULL,
    compute_price character varying NOT NULL,
    min_quantity numeric,
    fixed_price numeric,
    price_discount numeric,
    price_round numeric,
    price_surcharge numeric,
    price_markup numeric,
    price_min_margin numeric,
    price_max_margin numeric,
    date_start timestamp without time zone,
    date_end timestamp without time zone,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    percent_price double precision
);


ALTER TABLE public.product_pricelist_item OWNER TO felipe;

--
-- Name: TABLE product_pricelist_item; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_pricelist_item IS 'Pricelist Rule';


--
-- Name: COLUMN product_pricelist_item.pricelist_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.pricelist_id IS 'Pricelist';


--
-- Name: COLUMN product_pricelist_item.company_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.company_id IS 'Company';


--
-- Name: COLUMN product_pricelist_item.currency_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.currency_id IS 'Currency';


--
-- Name: COLUMN product_pricelist_item.categ_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.categ_id IS 'Category';


--
-- Name: COLUMN product_pricelist_item.product_tmpl_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.product_tmpl_id IS 'Product';


--
-- Name: COLUMN product_pricelist_item.product_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.product_id IS 'Variant';


--
-- Name: COLUMN product_pricelist_item.base_pricelist_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.base_pricelist_id IS 'Other Pricelist';


--
-- Name: COLUMN product_pricelist_item.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.create_uid IS 'Created by';


--
-- Name: COLUMN product_pricelist_item.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_pricelist_item.applied_on; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.applied_on IS 'Apply On';


--
-- Name: COLUMN product_pricelist_item.display_applied_on; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.display_applied_on IS 'Display Applied On';


--
-- Name: COLUMN product_pricelist_item.base; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.base IS 'Based on';


--
-- Name: COLUMN product_pricelist_item.compute_price; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.compute_price IS 'Compute Price';


--
-- Name: COLUMN product_pricelist_item.min_quantity; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.min_quantity IS 'Min. Quantity';


--
-- Name: COLUMN product_pricelist_item.fixed_price; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.fixed_price IS 'Fixed Price';


--
-- Name: COLUMN product_pricelist_item.price_discount; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.price_discount IS 'Price Discount';


--
-- Name: COLUMN product_pricelist_item.price_round; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.price_round IS 'Price Rounding';


--
-- Name: COLUMN product_pricelist_item.price_surcharge; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.price_surcharge IS 'Extra Fee';


--
-- Name: COLUMN product_pricelist_item.price_markup; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.price_markup IS 'Markup';


--
-- Name: COLUMN product_pricelist_item.price_min_margin; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.price_min_margin IS 'Min. Price Margin';


--
-- Name: COLUMN product_pricelist_item.price_max_margin; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.price_max_margin IS 'Max. Price Margin';


--
-- Name: COLUMN product_pricelist_item.date_start; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.date_start IS 'Start Date';


--
-- Name: COLUMN product_pricelist_item.date_end; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.date_end IS 'End Date';


--
-- Name: COLUMN product_pricelist_item.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.create_date IS 'Created on';


--
-- Name: COLUMN product_pricelist_item.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.write_date IS 'Last Updated on';


--
-- Name: COLUMN product_pricelist_item.percent_price; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_pricelist_item.percent_price IS 'Percentage Price';


--
-- Name: product_pricelist_item_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_pricelist_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_pricelist_item_id_seq OWNER TO felipe;

--
-- Name: product_pricelist_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_pricelist_item_id_seq OWNED BY public.product_pricelist_item.id;


--
-- Name: product_pricelist_res_config_settings_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_pricelist_res_config_settings_rel (
    res_config_settings_id integer NOT NULL,
    product_pricelist_id integer NOT NULL
);


ALTER TABLE public.product_pricelist_res_config_settings_rel OWNER TO felipe;

--
-- Name: TABLE product_pricelist_res_config_settings_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_pricelist_res_config_settings_rel IS 'RELATION BETWEEN res_config_settings AND product_pricelist';


--
-- Name: product_product; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_product (
    id integer NOT NULL,
    product_tmpl_id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    default_code character varying,
    barcode character varying,
    combination_indices character varying,
    standard_price jsonb,
    volume numeric,
    weight numeric,
    active boolean,
    can_image_variant_1024_be_zoomed boolean,
    write_date timestamp without time zone,
    create_date timestamp without time zone,
    lot_properties_definition jsonb
);


ALTER TABLE public.product_product OWNER TO felipe;

--
-- Name: TABLE product_product; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_product IS 'Product Variant';


--
-- Name: COLUMN product_product.product_tmpl_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.product_tmpl_id IS 'Product Template';


--
-- Name: COLUMN product_product.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.create_uid IS 'Created by';


--
-- Name: COLUMN product_product.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_product.default_code; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.default_code IS 'Internal Reference';


--
-- Name: COLUMN product_product.barcode; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.barcode IS 'Barcode';


--
-- Name: COLUMN product_product.combination_indices; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.combination_indices IS 'Combination Indices';


--
-- Name: COLUMN product_product.standard_price; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.standard_price IS 'Cost';


--
-- Name: COLUMN product_product.volume; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.volume IS 'Volume';


--
-- Name: COLUMN product_product.weight; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.weight IS 'Weight';


--
-- Name: COLUMN product_product.active; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.active IS 'Active';


--
-- Name: COLUMN product_product.can_image_variant_1024_be_zoomed; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.can_image_variant_1024_be_zoomed IS 'Can Variant Image 1024 be zoomed';


--
-- Name: COLUMN product_product.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.write_date IS 'Write Date';


--
-- Name: COLUMN product_product.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.create_date IS 'Created on';


--
-- Name: COLUMN product_product.lot_properties_definition; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_product.lot_properties_definition IS 'Lot Properties';


--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_product_id_seq OWNER TO felipe;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product_product.id;


--
-- Name: product_product_stock_track_confirmation_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_product_stock_track_confirmation_rel (
    stock_track_confirmation_id integer NOT NULL,
    product_product_id integer NOT NULL
);


ALTER TABLE public.product_product_stock_track_confirmation_rel OWNER TO felipe;

--
-- Name: TABLE product_product_stock_track_confirmation_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_product_stock_track_confirmation_rel IS 'RELATION BETWEEN stock_track_confirmation AND product_product';


--
-- Name: product_removal; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_removal (
    id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    name jsonb NOT NULL,
    method jsonb NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone
);


ALTER TABLE public.product_removal OWNER TO felipe;

--
-- Name: TABLE product_removal; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_removal IS 'Removal Strategy';


--
-- Name: COLUMN product_removal.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_removal.create_uid IS 'Created by';


--
-- Name: COLUMN product_removal.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_removal.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_removal.name; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_removal.name IS 'Name';


--
-- Name: COLUMN product_removal.method; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_removal.method IS 'Method';


--
-- Name: COLUMN product_removal.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_removal.create_date IS 'Created on';


--
-- Name: COLUMN product_removal.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_removal.write_date IS 'Last Updated on';


--
-- Name: product_removal_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_removal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_removal_id_seq OWNER TO felipe;

--
-- Name: product_removal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_removal_id_seq OWNED BY public.product_removal.id;


--
-- Name: product_replenish; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_replenish (
    id integer NOT NULL,
    route_id integer,
    product_id integer NOT NULL,
    product_tmpl_id integer NOT NULL,
    product_uom_id integer NOT NULL,
    warehouse_id integer NOT NULL,
    company_id integer,
    create_uid integer,
    write_uid integer,
    product_has_variants boolean NOT NULL,
    date_planned timestamp without time zone NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    quantity double precision NOT NULL,
    bom_id integer
);


ALTER TABLE public.product_replenish OWNER TO felipe;

--
-- Name: TABLE product_replenish; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_replenish IS 'Product Replenish';


--
-- Name: COLUMN product_replenish.route_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.route_id IS 'Preferred Route';


--
-- Name: COLUMN product_replenish.product_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.product_id IS 'Product';


--
-- Name: COLUMN product_replenish.product_tmpl_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.product_tmpl_id IS 'Product Template';


--
-- Name: COLUMN product_replenish.product_uom_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.product_uom_id IS 'Unity of measure';


--
-- Name: COLUMN product_replenish.warehouse_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.warehouse_id IS 'Warehouse';


--
-- Name: COLUMN product_replenish.company_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.company_id IS 'Company';


--
-- Name: COLUMN product_replenish.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.create_uid IS 'Created by';


--
-- Name: COLUMN product_replenish.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_replenish.product_has_variants; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.product_has_variants IS 'Has variants';


--
-- Name: COLUMN product_replenish.date_planned; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.date_planned IS 'Scheduled Date';


--
-- Name: COLUMN product_replenish.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.create_date IS 'Created on';


--
-- Name: COLUMN product_replenish.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.write_date IS 'Last Updated on';


--
-- Name: COLUMN product_replenish.quantity; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.quantity IS 'Quantity';


--
-- Name: COLUMN product_replenish.bom_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_replenish.bom_id IS 'Bill of Material';


--
-- Name: product_replenish_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_replenish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_replenish_id_seq OWNER TO felipe;

--
-- Name: product_replenish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_replenish_id_seq OWNED BY public.product_replenish.id;


--
-- Name: product_supplier_taxes_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_supplier_taxes_rel (
    prod_id integer NOT NULL,
    tax_id integer NOT NULL
);


ALTER TABLE public.product_supplier_taxes_rel OWNER TO felipe;

--
-- Name: TABLE product_supplier_taxes_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_supplier_taxes_rel IS 'RELATION BETWEEN product_template AND account_tax';


--
-- Name: product_supplierinfo; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_supplierinfo (
    id integer NOT NULL,
    partner_id integer NOT NULL,
    sequence integer,
    company_id integer,
    currency_id integer NOT NULL,
    product_id integer,
    product_tmpl_id integer,
    delay integer NOT NULL,
    create_uid integer,
    write_uid integer,
    product_name character varying,
    product_code character varying,
    date_start date,
    date_end date,
    min_qty numeric NOT NULL,
    price numeric NOT NULL,
    discount numeric,
    create_date timestamp without time zone,
    write_date timestamp without time zone
);


ALTER TABLE public.product_supplierinfo OWNER TO felipe;

--
-- Name: TABLE product_supplierinfo; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_supplierinfo IS 'Supplier Pricelist';


--
-- Name: COLUMN product_supplierinfo.partner_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.partner_id IS 'Vendor';


--
-- Name: COLUMN product_supplierinfo.sequence; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.sequence IS 'Sequence';


--
-- Name: COLUMN product_supplierinfo.company_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.company_id IS 'Company';


--
-- Name: COLUMN product_supplierinfo.currency_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.currency_id IS 'Currency';


--
-- Name: COLUMN product_supplierinfo.product_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.product_id IS 'Product Variant';


--
-- Name: COLUMN product_supplierinfo.product_tmpl_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.product_tmpl_id IS 'Product Template';


--
-- Name: COLUMN product_supplierinfo.delay; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.delay IS 'Delivery Lead Time';


--
-- Name: COLUMN product_supplierinfo.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.create_uid IS 'Created by';


--
-- Name: COLUMN product_supplierinfo.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_supplierinfo.product_name; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.product_name IS 'Vendor Product Name';


--
-- Name: COLUMN product_supplierinfo.product_code; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.product_code IS 'Vendor Product Code';


--
-- Name: COLUMN product_supplierinfo.date_start; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.date_start IS 'Start Date';


--
-- Name: COLUMN product_supplierinfo.date_end; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.date_end IS 'End Date';


--
-- Name: COLUMN product_supplierinfo.min_qty; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.min_qty IS 'Quantity';


--
-- Name: COLUMN product_supplierinfo.price; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.price IS 'Price';


--
-- Name: COLUMN product_supplierinfo.discount; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.discount IS 'Discount (%)';


--
-- Name: COLUMN product_supplierinfo.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.create_date IS 'Created on';


--
-- Name: COLUMN product_supplierinfo.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_supplierinfo.write_date IS 'Last Updated on';


--
-- Name: product_supplierinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_supplierinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_supplierinfo_id_seq OWNER TO felipe;

--
-- Name: product_supplierinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_supplierinfo_id_seq OWNED BY public.product_supplierinfo.id;


--
-- Name: product_tag; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_tag (
    id integer NOT NULL,
    sequence integer,
    create_uid integer,
    write_uid integer,
    color character varying,
    name jsonb NOT NULL,
    create_date timestamp without time zone,
    write_date timestamp without time zone
);


ALTER TABLE public.product_tag OWNER TO felipe;

--
-- Name: TABLE product_tag; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_tag IS 'Product Tag';


--
-- Name: COLUMN product_tag.sequence; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_tag.sequence IS 'Sequence';


--
-- Name: COLUMN product_tag.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_tag.create_uid IS 'Created by';


--
-- Name: COLUMN product_tag.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_tag.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_tag.color; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_tag.color IS 'Color';


--
-- Name: COLUMN product_tag.name; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_tag.name IS 'Name';


--
-- Name: COLUMN product_tag.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_tag.create_date IS 'Created on';


--
-- Name: COLUMN product_tag.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_tag.write_date IS 'Last Updated on';


--
-- Name: product_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_tag_id_seq OWNER TO felipe;

--
-- Name: product_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_tag_id_seq OWNED BY public.product_tag.id;


--
-- Name: product_tag_product_product_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_tag_product_product_rel (
    product_product_id integer NOT NULL,
    product_tag_id integer NOT NULL
);


ALTER TABLE public.product_tag_product_product_rel OWNER TO felipe;

--
-- Name: TABLE product_tag_product_product_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_tag_product_product_rel IS 'RELATION BETWEEN product_product AND product_tag';


--
-- Name: product_tag_product_template_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_tag_product_template_rel (
    product_template_id integer NOT NULL,
    product_tag_id integer NOT NULL
);


ALTER TABLE public.product_tag_product_template_rel OWNER TO felipe;

--
-- Name: TABLE product_tag_product_template_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_tag_product_template_rel IS 'RELATION BETWEEN product_template AND product_tag';


--
-- Name: product_taxes_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_taxes_rel (
    prod_id integer NOT NULL,
    tax_id integer NOT NULL
);


ALTER TABLE public.product_taxes_rel OWNER TO felipe;

--
-- Name: TABLE product_taxes_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_taxes_rel IS 'RELATION BETWEEN product_template AND account_tax';


--
-- Name: product_template; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_template (
    id integer NOT NULL,
    sequence integer,
    categ_id integer NOT NULL,
    uom_id integer NOT NULL,
    uom_po_id integer NOT NULL,
    company_id integer,
    color integer,
    create_uid integer,
    write_uid integer,
    type character varying NOT NULL,
    service_tracking character varying NOT NULL,
    default_code character varying,
    name jsonb NOT NULL,
    description jsonb,
    description_purchase jsonb,
    description_sale jsonb,
    product_properties jsonb,
    list_price numeric,
    volume numeric,
    weight numeric,
    sale_ok boolean,
    purchase_ok boolean,
    active boolean,
    can_image_1024_be_zoomed boolean,
    has_configurable_attributes boolean,
    is_favorite boolean,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    property_account_income_id jsonb,
    property_account_expense_id jsonb,
    service_type character varying,
    sale_line_warn character varying NOT NULL,
    expense_policy character varying,
    invoice_policy character varying,
    sale_line_warn_msg text,
    project_id jsonb,
    project_template_id jsonb,
    sale_delay integer,
    tracking character varying NOT NULL,
    responsible_id jsonb,
    property_stock_production jsonb,
    property_stock_inventory jsonb,
    description_picking jsonb,
    description_pickingout jsonb,
    description_pickingin jsonb,
    is_storable boolean,
    lot_valuated boolean,
    public_description jsonb,
    available_in_pos boolean,
    to_weight boolean
);


ALTER TABLE public.product_template OWNER TO felipe;

--
-- Name: TABLE product_template; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_template IS 'Product';


--
-- Name: COLUMN product_template.sequence; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.sequence IS 'Sequence';


--
-- Name: COLUMN product_template.categ_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.categ_id IS 'Product Category';


--
-- Name: COLUMN product_template.uom_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.uom_id IS 'Unit of Measure';


--
-- Name: COLUMN product_template.uom_po_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.uom_po_id IS 'Purchase Unit';


--
-- Name: COLUMN product_template.company_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.company_id IS 'Company';


--
-- Name: COLUMN product_template.color; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.color IS 'Color Index';


--
-- Name: COLUMN product_template.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.create_uid IS 'Created by';


--
-- Name: COLUMN product_template.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_template.type; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.type IS 'Product Type';


--
-- Name: COLUMN product_template.service_tracking; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.service_tracking IS 'Create on Order';


--
-- Name: COLUMN product_template.default_code; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.default_code IS 'Internal Reference';


--
-- Name: COLUMN product_template.name; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.name IS 'Name';


--
-- Name: COLUMN product_template.description; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.description IS 'Description';


--
-- Name: COLUMN product_template.description_purchase; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.description_purchase IS 'Purchase Description';


--
-- Name: COLUMN product_template.description_sale; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.description_sale IS 'Sales Description';


--
-- Name: COLUMN product_template.product_properties; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.product_properties IS 'Properties';


--
-- Name: COLUMN product_template.list_price; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.list_price IS 'Sales Price';


--
-- Name: COLUMN product_template.volume; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.volume IS 'Volume';


--
-- Name: COLUMN product_template.weight; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.weight IS 'Weight';


--
-- Name: COLUMN product_template.sale_ok; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.sale_ok IS 'Sales';


--
-- Name: COLUMN product_template.purchase_ok; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.purchase_ok IS 'Purchase';


--
-- Name: COLUMN product_template.active; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.active IS 'Active';


--
-- Name: COLUMN product_template.can_image_1024_be_zoomed; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.can_image_1024_be_zoomed IS 'Can Image 1024 be zoomed';


--
-- Name: COLUMN product_template.has_configurable_attributes; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.has_configurable_attributes IS 'Is a configurable product';


--
-- Name: COLUMN product_template.is_favorite; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.is_favorite IS 'Favorite';


--
-- Name: COLUMN product_template.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.create_date IS 'Created on';


--
-- Name: COLUMN product_template.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.write_date IS 'Last Updated on';


--
-- Name: COLUMN product_template.property_account_income_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.property_account_income_id IS 'Income Account';


--
-- Name: COLUMN product_template.property_account_expense_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.property_account_expense_id IS 'Expense Account';


--
-- Name: COLUMN product_template.service_type; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.service_type IS 'Track Service';


--
-- Name: COLUMN product_template.sale_line_warn; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.sale_line_warn IS 'Sales Order Line';


--
-- Name: COLUMN product_template.expense_policy; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.expense_policy IS 'Re-Invoice Costs';


--
-- Name: COLUMN product_template.invoice_policy; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.invoice_policy IS 'Invoicing Policy';


--
-- Name: COLUMN product_template.sale_line_warn_msg; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.sale_line_warn_msg IS 'Message for Sales Order Line';


--
-- Name: COLUMN product_template.project_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.project_id IS 'Project';


--
-- Name: COLUMN product_template.project_template_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.project_template_id IS 'Project Template';


--
-- Name: COLUMN product_template.sale_delay; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.sale_delay IS 'Customer Lead Time';


--
-- Name: COLUMN product_template.tracking; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.tracking IS 'Tracking';


--
-- Name: COLUMN product_template.responsible_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.responsible_id IS 'Responsible';


--
-- Name: COLUMN product_template.property_stock_production; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.property_stock_production IS 'Production Location';


--
-- Name: COLUMN product_template.property_stock_inventory; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.property_stock_inventory IS 'Inventory Location';


--
-- Name: COLUMN product_template.description_picking; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.description_picking IS 'Description on Picking';


--
-- Name: COLUMN product_template.description_pickingout; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.description_pickingout IS 'Description on Delivery Orders';


--
-- Name: COLUMN product_template.description_pickingin; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.description_pickingin IS 'Description on Receptions';


--
-- Name: COLUMN product_template.is_storable; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.is_storable IS 'Track Inventory';


--
-- Name: COLUMN product_template.lot_valuated; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.lot_valuated IS 'Valuation by Lot/Serial number';


--
-- Name: COLUMN product_template.public_description; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.public_description IS 'Product Description';


--
-- Name: COLUMN product_template.available_in_pos; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.available_in_pos IS 'Available in POS';


--
-- Name: COLUMN product_template.to_weight; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template.to_weight IS 'To Weigh With Scale';


--
-- Name: product_template_attribute_exclusion; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_template_attribute_exclusion (
    id integer NOT NULL,
    product_template_attribute_value_id integer,
    product_tmpl_id integer NOT NULL,
    create_uid integer,
    write_uid integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone
);


ALTER TABLE public.product_template_attribute_exclusion OWNER TO felipe;

--
-- Name: TABLE product_template_attribute_exclusion; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_template_attribute_exclusion IS 'Product Template Attribute Exclusion';


--
-- Name: COLUMN product_template_attribute_exclusion.product_template_attribute_value_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_exclusion.product_template_attribute_value_id IS 'Attribute Value';


--
-- Name: COLUMN product_template_attribute_exclusion.product_tmpl_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_exclusion.product_tmpl_id IS 'Product Template';


--
-- Name: COLUMN product_template_attribute_exclusion.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_exclusion.create_uid IS 'Created by';


--
-- Name: COLUMN product_template_attribute_exclusion.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_exclusion.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_template_attribute_exclusion.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_exclusion.create_date IS 'Created on';


--
-- Name: COLUMN product_template_attribute_exclusion.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_exclusion.write_date IS 'Last Updated on';


--
-- Name: product_template_attribute_exclusion_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_template_attribute_exclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_template_attribute_exclusion_id_seq OWNER TO felipe;

--
-- Name: product_template_attribute_exclusion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_template_attribute_exclusion_id_seq OWNED BY public.product_template_attribute_exclusion.id;


--
-- Name: product_template_attribute_line; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_template_attribute_line (
    id integer NOT NULL,
    product_tmpl_id integer NOT NULL,
    sequence integer,
    attribute_id integer NOT NULL,
    value_count integer,
    create_uid integer,
    write_uid integer,
    active boolean,
    create_date timestamp without time zone,
    write_date timestamp without time zone
);


ALTER TABLE public.product_template_attribute_line OWNER TO felipe;

--
-- Name: TABLE product_template_attribute_line; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_template_attribute_line IS 'Product Template Attribute Line';


--
-- Name: COLUMN product_template_attribute_line.product_tmpl_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_line.product_tmpl_id IS 'Product Template';


--
-- Name: COLUMN product_template_attribute_line.sequence; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_line.sequence IS 'Sequence';


--
-- Name: COLUMN product_template_attribute_line.attribute_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_line.attribute_id IS 'Attribute';


--
-- Name: COLUMN product_template_attribute_line.value_count; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_line.value_count IS 'Value Count';


--
-- Name: COLUMN product_template_attribute_line.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_line.create_uid IS 'Created by';


--
-- Name: COLUMN product_template_attribute_line.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_line.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_template_attribute_line.active; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_line.active IS 'Active';


--
-- Name: COLUMN product_template_attribute_line.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_line.create_date IS 'Created on';


--
-- Name: COLUMN product_template_attribute_line.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_line.write_date IS 'Last Updated on';


--
-- Name: product_template_attribute_line_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_template_attribute_line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_template_attribute_line_id_seq OWNER TO felipe;

--
-- Name: product_template_attribute_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_template_attribute_line_id_seq OWNED BY public.product_template_attribute_line.id;


--
-- Name: product_template_attribute_value; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_template_attribute_value (
    id integer NOT NULL,
    product_attribute_value_id integer NOT NULL,
    attribute_line_id integer NOT NULL,
    product_tmpl_id integer,
    attribute_id integer,
    color integer,
    create_uid integer,
    write_uid integer,
    price_extra numeric,
    ptav_active boolean,
    create_date timestamp without time zone,
    write_date timestamp without time zone
);


ALTER TABLE public.product_template_attribute_value OWNER TO felipe;

--
-- Name: TABLE product_template_attribute_value; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_template_attribute_value IS 'Product Template Attribute Value';


--
-- Name: COLUMN product_template_attribute_value.product_attribute_value_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_value.product_attribute_value_id IS 'Attribute Value';


--
-- Name: COLUMN product_template_attribute_value.attribute_line_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_value.attribute_line_id IS 'Attribute Line';


--
-- Name: COLUMN product_template_attribute_value.product_tmpl_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_value.product_tmpl_id IS 'Product Template';


--
-- Name: COLUMN product_template_attribute_value.attribute_id; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_value.attribute_id IS 'Attribute';


--
-- Name: COLUMN product_template_attribute_value.color; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_value.color IS 'Color';


--
-- Name: COLUMN product_template_attribute_value.create_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_value.create_uid IS 'Created by';


--
-- Name: COLUMN product_template_attribute_value.write_uid; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_value.write_uid IS 'Last Updated by';


--
-- Name: COLUMN product_template_attribute_value.price_extra; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_value.price_extra IS 'Extra Price';


--
-- Name: COLUMN product_template_attribute_value.ptav_active; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_value.ptav_active IS 'Active';


--
-- Name: COLUMN product_template_attribute_value.create_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_value.create_date IS 'Created on';


--
-- Name: COLUMN product_template_attribute_value.write_date; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON COLUMN public.product_template_attribute_value.write_date IS 'Last Updated on';


--
-- Name: product_template_attribute_value_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_template_attribute_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_template_attribute_value_id_seq OWNER TO felipe;

--
-- Name: product_template_attribute_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_template_attribute_value_id_seq OWNED BY public.product_template_attribute_value.id;


--
-- Name: product_template_attribute_value_sale_order_line_rel; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_template_attribute_value_sale_order_line_rel (
    sale_order_line_id integer NOT NULL,
    product_template_attribute_value_id integer NOT NULL
);


ALTER TABLE public.product_template_attribute_value_sale_order_line_rel OWNER TO felipe;

--
-- Name: TABLE product_template_attribute_value_sale_order_line_rel; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_template_attribute_value_sale_order_line_rel IS 'RELATION BETWEEN sale_order_line AND product_template_attribute_value';


--
-- Name: product_template_id_seq; Type: SEQUENCE; Schema: public; Owner: felipe
--

CREATE SEQUENCE public.product_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_template_id_seq OWNER TO felipe;

--
-- Name: product_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: felipe
--

ALTER SEQUENCE public.product_template_id_seq OWNED BY public.product_template.id;


--
-- Name: product_variant_combination; Type: TABLE; Schema: public; Owner: felipe
--

CREATE TABLE public.product_variant_combination (
    product_product_id integer NOT NULL,
    product_template_attribute_value_id integer NOT NULL
);


ALTER TABLE public.product_variant_combination OWNER TO felipe;

--
-- Name: TABLE product_variant_combination; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON TABLE public.product_variant_combination IS 'RELATION BETWEEN product_product AND product_template_attribute_value';


--
-- Name: product_attribute id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute ALTER COLUMN id SET DEFAULT nextval('public.product_attribute_id_seq'::regclass);


--
-- Name: product_attribute_custom_value id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_custom_value ALTER COLUMN id SET DEFAULT nextval('public.product_attribute_custom_value_id_seq'::regclass);


--
-- Name: product_attribute_value id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_value ALTER COLUMN id SET DEFAULT nextval('public.product_attribute_value_id_seq'::regclass);


--
-- Name: product_category id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_category ALTER COLUMN id SET DEFAULT nextval('public.product_category_id_seq'::regclass);


--
-- Name: product_combo id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo ALTER COLUMN id SET DEFAULT nextval('public.product_combo_id_seq'::regclass);


--
-- Name: product_combo_item id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo_item ALTER COLUMN id SET DEFAULT nextval('public.product_combo_item_id_seq'::regclass);


--
-- Name: product_document id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_document ALTER COLUMN id SET DEFAULT nextval('public.product_document_id_seq'::regclass);


--
-- Name: product_label_layout id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout ALTER COLUMN id SET DEFAULT nextval('public.product_label_layout_id_seq'::regclass);


--
-- Name: product_packaging id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_packaging ALTER COLUMN id SET DEFAULT nextval('public.product_packaging_id_seq'::regclass);


--
-- Name: product_pricelist id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist ALTER COLUMN id SET DEFAULT nextval('public.product_pricelist_id_seq'::regclass);


--
-- Name: product_pricelist_item id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_item ALTER COLUMN id SET DEFAULT nextval('public.product_pricelist_item_id_seq'::regclass);


--
-- Name: product_product id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_product ALTER COLUMN id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: product_removal id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_removal ALTER COLUMN id SET DEFAULT nextval('public.product_removal_id_seq'::regclass);


--
-- Name: product_replenish id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_replenish ALTER COLUMN id SET DEFAULT nextval('public.product_replenish_id_seq'::regclass);


--
-- Name: product_supplierinfo id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_supplierinfo ALTER COLUMN id SET DEFAULT nextval('public.product_supplierinfo_id_seq'::regclass);


--
-- Name: product_tag id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_tag ALTER COLUMN id SET DEFAULT nextval('public.product_tag_id_seq'::regclass);


--
-- Name: product_template id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template ALTER COLUMN id SET DEFAULT nextval('public.product_template_id_seq'::regclass);


--
-- Name: product_template_attribute_exclusion id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_exclusion ALTER COLUMN id SET DEFAULT nextval('public.product_template_attribute_exclusion_id_seq'::regclass);


--
-- Name: product_template_attribute_line id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_line ALTER COLUMN id SET DEFAULT nextval('public.product_template_attribute_line_id_seq'::regclass);


--
-- Name: product_template_attribute_value id; Type: DEFAULT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_value ALTER COLUMN id SET DEFAULT nextval('public.product_template_attribute_value_id_seq'::regclass);


--
-- Name: product_attr_exclusion_value_ids_rel product_attr_exclusion_value_ids_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attr_exclusion_value_ids_rel
    ADD CONSTRAINT product_attr_exclusion_value_ids_rel_pkey PRIMARY KEY (product_template_attribute_exclusion_id, product_template_attribute_value_id);


--
-- Name: product_attribute_custom_value product_attribute_custom_value_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_custom_value
    ADD CONSTRAINT product_attribute_custom_value_pkey PRIMARY KEY (id);


--
-- Name: product_attribute_custom_value product_attribute_custom_value_sol_custom_value_unique; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_custom_value
    ADD CONSTRAINT product_attribute_custom_value_sol_custom_value_unique UNIQUE (custom_product_template_attribute_value_id, sale_order_line_id);


--
-- Name: CONSTRAINT product_attribute_custom_value_sol_custom_value_unique ON product_attribute_custom_value; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON CONSTRAINT product_attribute_custom_value_sol_custom_value_unique ON public.product_attribute_custom_value IS 'unique(custom_product_template_attribute_value_id, sale_order_line_id)';


--
-- Name: product_attribute product_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_pkey PRIMARY KEY (id);


--
-- Name: product_attribute_product_template_rel product_attribute_product_template_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_product_template_rel
    ADD CONSTRAINT product_attribute_product_template_rel_pkey PRIMARY KEY (product_attribute_id, product_template_id);


--
-- Name: product_attribute_value product_attribute_value_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_value
    ADD CONSTRAINT product_attribute_value_pkey PRIMARY KEY (id);


--
-- Name: product_attribute_value_product_template_attribute_line_rel product_attribute_value_product_template_attribute_line_re_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_value_product_template_attribute_line_rel
    ADD CONSTRAINT product_attribute_value_product_template_attribute_line_re_pkey PRIMARY KEY (product_attribute_value_id, product_template_attribute_line_id);


--
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- Name: product_combo_item product_combo_item_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo_item
    ADD CONSTRAINT product_combo_item_pkey PRIMARY KEY (id);


--
-- Name: product_combo product_combo_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo
    ADD CONSTRAINT product_combo_pkey PRIMARY KEY (id);


--
-- Name: product_combo_product_template_rel product_combo_product_template_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo_product_template_rel
    ADD CONSTRAINT product_combo_product_template_rel_pkey PRIMARY KEY (product_template_id, product_combo_id);


--
-- Name: product_document product_document_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_document
    ADD CONSTRAINT product_document_pkey PRIMARY KEY (id);


--
-- Name: product_document_sale_pdf_form_field_rel product_document_sale_pdf_form_field_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_document_sale_pdf_form_field_rel
    ADD CONSTRAINT product_document_sale_pdf_form_field_rel_pkey PRIMARY KEY (product_document_id, sale_pdf_form_field_id);


--
-- Name: product_label_layout product_label_layout_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout
    ADD CONSTRAINT product_label_layout_pkey PRIMARY KEY (id);


--
-- Name: product_label_layout_product_product_rel product_label_layout_product_product_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout_product_product_rel
    ADD CONSTRAINT product_label_layout_product_product_rel_pkey PRIMARY KEY (product_label_layout_id, product_product_id);


--
-- Name: product_label_layout_product_template_rel product_label_layout_product_template_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout_product_template_rel
    ADD CONSTRAINT product_label_layout_product_template_rel_pkey PRIMARY KEY (product_label_layout_id, product_template_id);


--
-- Name: product_label_layout_stock_move_rel product_label_layout_stock_move_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout_stock_move_rel
    ADD CONSTRAINT product_label_layout_stock_move_rel_pkey PRIMARY KEY (product_label_layout_id, stock_move_id);


--
-- Name: product_optional_rel product_optional_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_optional_rel
    ADD CONSTRAINT product_optional_rel_pkey PRIMARY KEY (src_id, dest_id);


--
-- Name: product_packaging product_packaging_barcode_uniq; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_packaging
    ADD CONSTRAINT product_packaging_barcode_uniq UNIQUE (barcode);


--
-- Name: CONSTRAINT product_packaging_barcode_uniq ON product_packaging; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON CONSTRAINT product_packaging_barcode_uniq ON public.product_packaging IS 'unique(barcode)';


--
-- Name: product_packaging product_packaging_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_packaging
    ADD CONSTRAINT product_packaging_pkey PRIMARY KEY (id);


--
-- Name: product_pricelist_item product_pricelist_item_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_item
    ADD CONSTRAINT product_pricelist_item_pkey PRIMARY KEY (id);


--
-- Name: product_pricelist product_pricelist_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist
    ADD CONSTRAINT product_pricelist_pkey PRIMARY KEY (id);


--
-- Name: product_pricelist_res_config_settings_rel product_pricelist_res_config_settings_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_res_config_settings_rel
    ADD CONSTRAINT product_pricelist_res_config_settings_rel_pkey PRIMARY KEY (res_config_settings_id, product_pricelist_id);


--
-- Name: product_product product_product_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_pkey PRIMARY KEY (id);


--
-- Name: product_product_stock_track_confirmation_rel product_product_stock_track_confirmation_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_product_stock_track_confirmation_rel
    ADD CONSTRAINT product_product_stock_track_confirmation_rel_pkey PRIMARY KEY (stock_track_confirmation_id, product_product_id);


--
-- Name: product_removal product_removal_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_removal
    ADD CONSTRAINT product_removal_pkey PRIMARY KEY (id);


--
-- Name: product_replenish product_replenish_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_replenish
    ADD CONSTRAINT product_replenish_pkey PRIMARY KEY (id);


--
-- Name: product_supplier_taxes_rel product_supplier_taxes_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_supplier_taxes_rel
    ADD CONSTRAINT product_supplier_taxes_rel_pkey PRIMARY KEY (prod_id, tax_id);


--
-- Name: product_supplierinfo product_supplierinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_supplierinfo
    ADD CONSTRAINT product_supplierinfo_pkey PRIMARY KEY (id);


--
-- Name: product_tag product_tag_name_uniq; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT product_tag_name_uniq UNIQUE (name);


--
-- Name: CONSTRAINT product_tag_name_uniq ON product_tag; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON CONSTRAINT product_tag_name_uniq ON public.product_tag IS 'unique (name)';


--
-- Name: product_tag product_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT product_tag_pkey PRIMARY KEY (id);


--
-- Name: product_tag_product_product_rel product_tag_product_product_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_tag_product_product_rel
    ADD CONSTRAINT product_tag_product_product_rel_pkey PRIMARY KEY (product_product_id, product_tag_id);


--
-- Name: product_tag_product_template_rel product_tag_product_template_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_tag_product_template_rel
    ADD CONSTRAINT product_tag_product_template_rel_pkey PRIMARY KEY (product_template_id, product_tag_id);


--
-- Name: product_taxes_rel product_taxes_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_taxes_rel
    ADD CONSTRAINT product_taxes_rel_pkey PRIMARY KEY (prod_id, tax_id);


--
-- Name: product_template_attribute_exclusion product_template_attribute_exclusion_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_exclusion
    ADD CONSTRAINT product_template_attribute_exclusion_pkey PRIMARY KEY (id);


--
-- Name: product_template_attribute_line product_template_attribute_line_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_line
    ADD CONSTRAINT product_template_attribute_line_pkey PRIMARY KEY (id);


--
-- Name: product_template_attribute_value product_template_attribute_value_attribute_value_unique; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_value
    ADD CONSTRAINT product_template_attribute_value_attribute_value_unique UNIQUE (attribute_line_id, product_attribute_value_id);


--
-- Name: CONSTRAINT product_template_attribute_value_attribute_value_unique ON product_template_attribute_value; Type: COMMENT; Schema: public; Owner: felipe
--

COMMENT ON CONSTRAINT product_template_attribute_value_attribute_value_unique ON public.product_template_attribute_value IS 'unique(attribute_line_id, product_attribute_value_id)';


--
-- Name: product_template_attribute_value product_template_attribute_value_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_value
    ADD CONSTRAINT product_template_attribute_value_pkey PRIMARY KEY (id);


--
-- Name: product_template_attribute_value_sale_order_line_rel product_template_attribute_value_sale_order_line_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_value_sale_order_line_rel
    ADD CONSTRAINT product_template_attribute_value_sale_order_line_rel_pkey PRIMARY KEY (sale_order_line_id, product_template_attribute_value_id);


--
-- Name: product_template product_template_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template
    ADD CONSTRAINT product_template_pkey PRIMARY KEY (id);


--
-- Name: product_variant_combination product_variant_combination_pkey; Type: CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_variant_combination
    ADD CONSTRAINT product_variant_combination_pkey PRIMARY KEY (product_product_id, product_template_attribute_value_id);


--
-- Name: product_attr_exclusion_value__product_template_attribute_va_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_attr_exclusion_value__product_template_attribute_va_idx ON public.product_attr_exclusion_value_ids_rel USING btree (product_template_attribute_value_id, product_template_attribute_exclusion_id);


--
-- Name: product_attribute__sequence_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_attribute__sequence_index ON public.product_attribute USING btree (sequence);


--
-- Name: product_attribute_product_tem_product_template_id_product_a_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_attribute_product_tem_product_template_id_product_a_idx ON public.product_attribute_product_template_rel USING btree (product_template_id, product_attribute_id);


--
-- Name: product_attribute_value__attribute_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_attribute_value__attribute_id_index ON public.product_attribute_value USING btree (attribute_id);


--
-- Name: product_attribute_value__sequence_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_attribute_value__sequence_index ON public.product_attribute_value USING btree (sequence);


--
-- Name: product_attribute_value_produ_product_template_attribute_li_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_attribute_value_produ_product_template_attribute_li_idx ON public.product_attribute_value_product_template_attribute_line_rel USING btree (product_template_attribute_line_id, product_attribute_value_id);


--
-- Name: product_category__parent_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_category__parent_id_index ON public.product_category USING btree (parent_id);


--
-- Name: product_category__parent_path_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_category__parent_path_index ON public.product_category USING btree (parent_path);


--
-- Name: product_category__property_account_downpayment_categ_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_category__property_account_downpayment_categ_id_index ON public.product_category USING btree (((property_account_downpayment_categ_id IS NOT NULL))) WHERE (property_account_downpayment_categ_id IS NOT NULL);


--
-- Name: product_category__property_account_expense_categ_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_category__property_account_expense_categ_id_index ON public.product_category USING btree (((property_account_expense_categ_id IS NOT NULL))) WHERE (property_account_expense_categ_id IS NOT NULL);


--
-- Name: product_category__property_account_income_categ_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_category__property_account_income_categ_id_index ON public.product_category USING btree (((property_account_income_categ_id IS NOT NULL))) WHERE (property_account_income_categ_id IS NOT NULL);


--
-- Name: product_category__property_cost_method_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_category__property_cost_method_index ON public.product_category USING btree (((property_cost_method IS NOT NULL))) WHERE (property_cost_method IS NOT NULL);


--
-- Name: product_category__property_stock_account_input_categ_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_category__property_stock_account_input_categ_id_index ON public.product_category USING btree (((property_stock_account_input_categ_id IS NOT NULL))) WHERE (property_stock_account_input_categ_id IS NOT NULL);


--
-- Name: product_category__property_stock_account_output_categ_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_category__property_stock_account_output_categ_id_index ON public.product_category USING btree (((property_stock_account_output_categ_id IS NOT NULL))) WHERE (property_stock_account_output_categ_id IS NOT NULL);


--
-- Name: product_category__property_stock_account_production_co_a9ab1a9e; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_category__property_stock_account_production_co_a9ab1a9e ON public.product_category USING btree (((property_stock_account_production_cost_id IS NOT NULL))) WHERE (property_stock_account_production_cost_id IS NOT NULL);


--
-- Name: product_category__property_stock_journal_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_category__property_stock_journal_index ON public.product_category USING btree (((property_stock_journal IS NOT NULL))) WHERE (property_stock_journal IS NOT NULL);


--
-- Name: product_category__property_stock_valuation_account_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_category__property_stock_valuation_account_id_index ON public.product_category USING btree (((property_stock_valuation_account_id IS NOT NULL))) WHERE (property_stock_valuation_account_id IS NOT NULL);


--
-- Name: product_category__property_valuation_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_category__property_valuation_index ON public.product_category USING btree (((property_valuation IS NOT NULL))) WHERE (property_valuation IS NOT NULL);


--
-- Name: product_combo__company_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_combo__company_id_index ON public.product_combo USING btree (company_id);


--
-- Name: product_combo_product_templat_product_combo_id_product_temp_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_combo_product_templat_product_combo_id_product_temp_idx ON public.product_combo_product_template_rel USING btree (product_combo_id, product_template_id);


--
-- Name: product_document_sale_pdf_for_sale_pdf_form_field_id_produc_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_document_sale_pdf_for_sale_pdf_form_field_id_produc_idx ON public.product_document_sale_pdf_form_field_rel USING btree (sale_pdf_form_field_id, product_document_id);


--
-- Name: product_label_layout_product__product_product_id_product_la_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_label_layout_product__product_product_id_product_la_idx ON public.product_label_layout_product_product_rel USING btree (product_product_id, product_label_layout_id);


--
-- Name: product_label_layout_product__product_template_id_product_l_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_label_layout_product__product_template_id_product_l_idx ON public.product_label_layout_product_template_rel USING btree (product_template_id, product_label_layout_id);


--
-- Name: product_label_layout_stock_mo_stock_move_id_product_label_l_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_label_layout_stock_mo_stock_move_id_product_label_l_idx ON public.product_label_layout_stock_move_rel USING btree (stock_move_id, product_label_layout_id);


--
-- Name: product_optional_rel_dest_id_src_id_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_optional_rel_dest_id_src_id_idx ON public.product_optional_rel USING btree (dest_id, src_id);


--
-- Name: product_packaging__company_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_packaging__company_id_index ON public.product_packaging USING btree (company_id);


--
-- Name: product_pricelist_item__compute_price_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_pricelist_item__compute_price_index ON public.product_pricelist_item USING btree (compute_price);


--
-- Name: product_pricelist_item__pricelist_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_pricelist_item__pricelist_id_index ON public.product_pricelist_item USING btree (pricelist_id);


--
-- Name: product_pricelist_res_config__product_pricelist_id_res_conf_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_pricelist_res_config__product_pricelist_id_res_conf_idx ON public.product_pricelist_res_config_settings_rel USING btree (product_pricelist_id, res_config_settings_id);


--
-- Name: product_product__barcode_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_product__barcode_index ON public.product_product USING btree (barcode) WHERE (barcode IS NOT NULL);


--
-- Name: product_product__combination_indices_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_product__combination_indices_index ON public.product_product USING btree (combination_indices);


--
-- Name: product_product__default_code_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_product__default_code_index ON public.product_product USING btree (default_code);


--
-- Name: product_product__product_tmpl_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_product__product_tmpl_id_index ON public.product_product USING btree (product_tmpl_id);


--
-- Name: product_product__standard_price_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_product__standard_price_index ON public.product_product USING btree (((standard_price IS NOT NULL))) WHERE (standard_price IS NOT NULL);


--
-- Name: product_product_combination_unique; Type: INDEX; Schema: public; Owner: felipe
--

CREATE UNIQUE INDEX product_product_combination_unique ON public.product_product USING btree (product_tmpl_id, combination_indices) WHERE (active IS TRUE);


--
-- Name: product_product_stock_track_c_product_product_id_stock_trac_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_product_stock_track_c_product_product_id_stock_trac_idx ON public.product_product_stock_track_confirmation_rel USING btree (product_product_id, stock_track_confirmation_id);


--
-- Name: product_supplier_taxes_rel_tax_id_prod_id_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_supplier_taxes_rel_tax_id_prod_id_idx ON public.product_supplier_taxes_rel USING btree (tax_id, prod_id);


--
-- Name: product_supplierinfo__company_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_supplierinfo__company_id_index ON public.product_supplierinfo USING btree (company_id);


--
-- Name: product_supplierinfo__product_tmpl_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_supplierinfo__product_tmpl_id_index ON public.product_supplierinfo USING btree (product_tmpl_id);


--
-- Name: product_tag_product_product_r_product_tag_id_product_produc_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_tag_product_product_r_product_tag_id_product_produc_idx ON public.product_tag_product_product_rel USING btree (product_tag_id, product_product_id);


--
-- Name: product_tag_product_template__product_tag_id_product_templa_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_tag_product_template__product_tag_id_product_templa_idx ON public.product_tag_product_template_rel USING btree (product_tag_id, product_template_id);


--
-- Name: product_taxes_rel_tax_id_prod_id_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_taxes_rel_tax_id_prod_id_idx ON public.product_taxes_rel USING btree (tax_id, prod_id);


--
-- Name: product_template__company_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template__company_id_index ON public.product_template USING btree (company_id);


--
-- Name: product_template__project_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template__project_id_index ON public.product_template USING btree (((project_id IS NOT NULL))) WHERE (project_id IS NOT NULL);


--
-- Name: product_template__project_template_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template__project_template_id_index ON public.product_template USING btree (((project_template_id IS NOT NULL))) WHERE (project_template_id IS NOT NULL);


--
-- Name: product_template__property_account_expense_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template__property_account_expense_id_index ON public.product_template USING btree (((property_account_expense_id IS NOT NULL))) WHERE (property_account_expense_id IS NOT NULL);


--
-- Name: product_template__property_account_income_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template__property_account_income_id_index ON public.product_template USING btree (((property_account_income_id IS NOT NULL))) WHERE (property_account_income_id IS NOT NULL);


--
-- Name: product_template__property_stock_inventory_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template__property_stock_inventory_index ON public.product_template USING btree (((property_stock_inventory IS NOT NULL))) WHERE (property_stock_inventory IS NOT NULL);


--
-- Name: product_template__property_stock_production_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template__property_stock_production_index ON public.product_template USING btree (((property_stock_production IS NOT NULL))) WHERE (property_stock_production IS NOT NULL);


--
-- Name: product_template__responsible_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template__responsible_id_index ON public.product_template USING btree (((responsible_id IS NOT NULL))) WHERE (responsible_id IS NOT NULL);


--
-- Name: product_template_attribute_exclusion__product_template_5b2f8938; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template_attribute_exclusion__product_template_5b2f8938 ON public.product_template_attribute_exclusion USING btree (product_template_attribute_value_id);


--
-- Name: product_template_attribute_exclusion__product_tmpl_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template_attribute_exclusion__product_tmpl_id_index ON public.product_template_attribute_exclusion USING btree (product_tmpl_id);


--
-- Name: product_template_attribute_line__attribute_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template_attribute_line__attribute_id_index ON public.product_template_attribute_line USING btree (attribute_id);


--
-- Name: product_template_attribute_line__product_tmpl_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template_attribute_line__product_tmpl_id_index ON public.product_template_attribute_line USING btree (product_tmpl_id);


--
-- Name: product_template_attribute_va_product_template_attribute_va_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template_attribute_va_product_template_attribute_va_idx ON public.product_template_attribute_value_sale_order_line_rel USING btree (product_template_attribute_value_id, sale_order_line_id);


--
-- Name: product_template_attribute_value__attribute_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template_attribute_value__attribute_id_index ON public.product_template_attribute_value USING btree (attribute_id);


--
-- Name: product_template_attribute_value__attribute_line_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template_attribute_value__attribute_line_id_index ON public.product_template_attribute_value USING btree (attribute_line_id);


--
-- Name: product_template_attribute_value__product_attribute_va_63041d9e; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template_attribute_value__product_attribute_va_63041d9e ON public.product_template_attribute_value USING btree (product_attribute_value_id);


--
-- Name: product_template_attribute_value__product_tmpl_id_index; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_template_attribute_value__product_tmpl_id_index ON public.product_template_attribute_value USING btree (product_tmpl_id);


--
-- Name: product_variant_combination_product_template_attribute_valu_idx; Type: INDEX; Schema: public; Owner: felipe
--

CREATE INDEX product_variant_combination_product_template_attribute_valu_idx ON public.product_variant_combination USING btree (product_template_attribute_value_id, product_product_id);


--
-- Name: product_attr_exclusion_value_ids_rel product_attr_exclusion_value__product_template_attribute_e_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attr_exclusion_value_ids_rel
    ADD CONSTRAINT product_attr_exclusion_value__product_template_attribute_e_fkey FOREIGN KEY (product_template_attribute_exclusion_id) REFERENCES public.product_template_attribute_exclusion(id) ON DELETE CASCADE;


--
-- Name: product_attr_exclusion_value_ids_rel product_attr_exclusion_value__product_template_attribute_v_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attr_exclusion_value_ids_rel
    ADD CONSTRAINT product_attr_exclusion_value__product_template_attribute_v_fkey FOREIGN KEY (product_template_attribute_value_id) REFERENCES public.product_template_attribute_value(id) ON DELETE CASCADE;


--
-- Name: product_attribute product_attribute_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_attribute_custom_value product_attribute_custom_valu_custom_product_template_attr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_custom_value
    ADD CONSTRAINT product_attribute_custom_valu_custom_product_template_attr_fkey FOREIGN KEY (custom_product_template_attribute_value_id) REFERENCES public.product_template_attribute_value(id) ON DELETE RESTRICT;


--
-- Name: product_attribute_custom_value product_attribute_custom_value_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_custom_value
    ADD CONSTRAINT product_attribute_custom_value_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_attribute_custom_value product_attribute_custom_value_pos_order_line_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_custom_value
    ADD CONSTRAINT product_attribute_custom_value_pos_order_line_id_fkey FOREIGN KEY (pos_order_line_id) REFERENCES public.pos_order_line(id) ON DELETE CASCADE;


--
-- Name: product_attribute_custom_value product_attribute_custom_value_sale_order_line_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_custom_value
    ADD CONSTRAINT product_attribute_custom_value_sale_order_line_id_fkey FOREIGN KEY (sale_order_line_id) REFERENCES public.sale_order_line(id) ON DELETE CASCADE;


--
-- Name: product_attribute_custom_value product_attribute_custom_value_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_custom_value
    ADD CONSTRAINT product_attribute_custom_value_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_attribute_product_template_rel product_attribute_product_template_re_product_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_product_template_rel
    ADD CONSTRAINT product_attribute_product_template_re_product_attribute_id_fkey FOREIGN KEY (product_attribute_id) REFERENCES public.product_attribute(id) ON DELETE CASCADE;


--
-- Name: product_attribute_product_template_rel product_attribute_product_template_rel_product_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_product_template_rel
    ADD CONSTRAINT product_attribute_product_template_rel_product_template_id_fkey FOREIGN KEY (product_template_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_attribute_value product_attribute_value_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_value
    ADD CONSTRAINT product_attribute_value_attribute_id_fkey FOREIGN KEY (attribute_id) REFERENCES public.product_attribute(id) ON DELETE CASCADE;


--
-- Name: product_attribute_value product_attribute_value_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_value
    ADD CONSTRAINT product_attribute_value_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_attribute_value_product_template_attribute_line_rel product_attribute_value_produ_product_template_attribute_l_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_value_product_template_attribute_line_rel
    ADD CONSTRAINT product_attribute_value_produ_product_template_attribute_l_fkey FOREIGN KEY (product_template_attribute_line_id) REFERENCES public.product_template_attribute_line(id) ON DELETE CASCADE;


--
-- Name: product_attribute_value_product_template_attribute_line_rel product_attribute_value_product_product_attribute_value_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_value_product_template_attribute_line_rel
    ADD CONSTRAINT product_attribute_value_product_product_attribute_value_id_fkey FOREIGN KEY (product_attribute_value_id) REFERENCES public.product_attribute_value(id) ON DELETE RESTRICT;


--
-- Name: product_attribute_value product_attribute_value_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute_value
    ADD CONSTRAINT product_attribute_value_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_attribute product_attribute_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_category product_category_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_category product_category_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.product_category(id) ON DELETE CASCADE;


--
-- Name: product_category product_category_removal_strategy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_removal_strategy_id_fkey FOREIGN KEY (removal_strategy_id) REFERENCES public.product_removal(id) ON DELETE SET NULL;


--
-- Name: product_category product_category_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_combo product_combo_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo
    ADD CONSTRAINT product_combo_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.res_company(id) ON DELETE SET NULL;


--
-- Name: product_combo product_combo_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo
    ADD CONSTRAINT product_combo_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_combo_item product_combo_item_combo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo_item
    ADD CONSTRAINT product_combo_item_combo_id_fkey FOREIGN KEY (combo_id) REFERENCES public.product_combo(id) ON DELETE CASCADE;


--
-- Name: product_combo_item product_combo_item_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo_item
    ADD CONSTRAINT product_combo_item_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.res_company(id) ON DELETE SET NULL;


--
-- Name: product_combo_item product_combo_item_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo_item
    ADD CONSTRAINT product_combo_item_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_combo_item product_combo_item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo_item
    ADD CONSTRAINT product_combo_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product_product(id) ON DELETE CASCADE;


--
-- Name: product_combo_item product_combo_item_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo_item
    ADD CONSTRAINT product_combo_item_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_combo_product_template_rel product_combo_product_template_rel_product_combo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo_product_template_rel
    ADD CONSTRAINT product_combo_product_template_rel_product_combo_id_fkey FOREIGN KEY (product_combo_id) REFERENCES public.product_combo(id) ON DELETE CASCADE;


--
-- Name: product_combo_product_template_rel product_combo_product_template_rel_product_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo_product_template_rel
    ADD CONSTRAINT product_combo_product_template_rel_product_template_id_fkey FOREIGN KEY (product_template_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_combo product_combo_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_combo
    ADD CONSTRAINT product_combo_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_document product_document_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_document
    ADD CONSTRAINT product_document_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_document product_document_ir_attachment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_document
    ADD CONSTRAINT product_document_ir_attachment_id_fkey FOREIGN KEY (ir_attachment_id) REFERENCES public.ir_attachment(id) ON DELETE CASCADE;


--
-- Name: product_document_sale_pdf_form_field_rel product_document_sale_pdf_form_fiel_sale_pdf_form_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_document_sale_pdf_form_field_rel
    ADD CONSTRAINT product_document_sale_pdf_form_fiel_sale_pdf_form_field_id_fkey FOREIGN KEY (sale_pdf_form_field_id) REFERENCES public.sale_pdf_form_field(id) ON DELETE CASCADE;


--
-- Name: product_document_sale_pdf_form_field_rel product_document_sale_pdf_form_field_r_product_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_document_sale_pdf_form_field_rel
    ADD CONSTRAINT product_document_sale_pdf_form_field_r_product_document_id_fkey FOREIGN KEY (product_document_id) REFERENCES public.product_document(id) ON DELETE CASCADE;


--
-- Name: product_document product_document_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_document
    ADD CONSTRAINT product_document_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_label_layout product_label_layout_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout
    ADD CONSTRAINT product_label_layout_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_label_layout product_label_layout_pricelist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout
    ADD CONSTRAINT product_label_layout_pricelist_id_fkey FOREIGN KEY (pricelist_id) REFERENCES public.product_pricelist(id) ON DELETE SET NULL;


--
-- Name: product_label_layout_product_product_rel product_label_layout_product_produ_product_label_layout_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout_product_product_rel
    ADD CONSTRAINT product_label_layout_product_produ_product_label_layout_id_fkey FOREIGN KEY (product_label_layout_id) REFERENCES public.product_label_layout(id) ON DELETE CASCADE;


--
-- Name: product_label_layout_product_product_rel product_label_layout_product_product_re_product_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout_product_product_rel
    ADD CONSTRAINT product_label_layout_product_product_re_product_product_id_fkey FOREIGN KEY (product_product_id) REFERENCES public.product_product(id) ON DELETE CASCADE;


--
-- Name: product_label_layout_product_template_rel product_label_layout_product_templ_product_label_layout_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout_product_template_rel
    ADD CONSTRAINT product_label_layout_product_templ_product_label_layout_id_fkey FOREIGN KEY (product_label_layout_id) REFERENCES public.product_label_layout(id) ON DELETE CASCADE;


--
-- Name: product_label_layout_product_template_rel product_label_layout_product_template__product_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout_product_template_rel
    ADD CONSTRAINT product_label_layout_product_template__product_template_id_fkey FOREIGN KEY (product_template_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_label_layout_stock_move_rel product_label_layout_stock_move_re_product_label_layout_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout_stock_move_rel
    ADD CONSTRAINT product_label_layout_stock_move_re_product_label_layout_id_fkey FOREIGN KEY (product_label_layout_id) REFERENCES public.product_label_layout(id) ON DELETE CASCADE;


--
-- Name: product_label_layout_stock_move_rel product_label_layout_stock_move_rel_stock_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout_stock_move_rel
    ADD CONSTRAINT product_label_layout_stock_move_rel_stock_move_id_fkey FOREIGN KEY (stock_move_id) REFERENCES public.stock_move(id) ON DELETE CASCADE;


--
-- Name: product_label_layout product_label_layout_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_label_layout
    ADD CONSTRAINT product_label_layout_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_optional_rel product_optional_rel_dest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_optional_rel
    ADD CONSTRAINT product_optional_rel_dest_id_fkey FOREIGN KEY (dest_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_optional_rel product_optional_rel_src_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_optional_rel
    ADD CONSTRAINT product_optional_rel_src_id_fkey FOREIGN KEY (src_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_packaging product_packaging_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_packaging
    ADD CONSTRAINT product_packaging_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.res_company(id) ON DELETE SET NULL;


--
-- Name: product_packaging product_packaging_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_packaging
    ADD CONSTRAINT product_packaging_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_packaging product_packaging_package_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_packaging
    ADD CONSTRAINT product_packaging_package_type_id_fkey FOREIGN KEY (package_type_id) REFERENCES public.stock_package_type(id) ON DELETE SET NULL;


--
-- Name: product_packaging product_packaging_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_packaging
    ADD CONSTRAINT product_packaging_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product_product(id) ON DELETE CASCADE;


--
-- Name: product_packaging product_packaging_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_packaging
    ADD CONSTRAINT product_packaging_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_pricelist product_pricelist_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist
    ADD CONSTRAINT product_pricelist_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.res_company(id) ON DELETE SET NULL;


--
-- Name: product_pricelist product_pricelist_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist
    ADD CONSTRAINT product_pricelist_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_pricelist product_pricelist_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist
    ADD CONSTRAINT product_pricelist_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.res_currency(id) ON DELETE RESTRICT;


--
-- Name: product_pricelist_item product_pricelist_item_base_pricelist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_item
    ADD CONSTRAINT product_pricelist_item_base_pricelist_id_fkey FOREIGN KEY (base_pricelist_id) REFERENCES public.product_pricelist(id) ON DELETE SET NULL;


--
-- Name: product_pricelist_item product_pricelist_item_categ_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_item
    ADD CONSTRAINT product_pricelist_item_categ_id_fkey FOREIGN KEY (categ_id) REFERENCES public.product_category(id) ON DELETE CASCADE;


--
-- Name: product_pricelist_item product_pricelist_item_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_item
    ADD CONSTRAINT product_pricelist_item_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.res_company(id) ON DELETE SET NULL;


--
-- Name: product_pricelist_item product_pricelist_item_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_item
    ADD CONSTRAINT product_pricelist_item_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_pricelist_item product_pricelist_item_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_item
    ADD CONSTRAINT product_pricelist_item_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.res_currency(id) ON DELETE SET NULL;


--
-- Name: product_pricelist_item product_pricelist_item_pricelist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_item
    ADD CONSTRAINT product_pricelist_item_pricelist_id_fkey FOREIGN KEY (pricelist_id) REFERENCES public.product_pricelist(id) ON DELETE CASCADE;


--
-- Name: product_pricelist_item product_pricelist_item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_item
    ADD CONSTRAINT product_pricelist_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product_product(id) ON DELETE CASCADE;


--
-- Name: product_pricelist_item product_pricelist_item_product_tmpl_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_item
    ADD CONSTRAINT product_pricelist_item_product_tmpl_id_fkey FOREIGN KEY (product_tmpl_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_pricelist_item product_pricelist_item_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_item
    ADD CONSTRAINT product_pricelist_item_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_pricelist_res_config_settings_rel product_pricelist_res_config_settin_res_config_settings_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_res_config_settings_rel
    ADD CONSTRAINT product_pricelist_res_config_settin_res_config_settings_id_fkey FOREIGN KEY (res_config_settings_id) REFERENCES public.res_config_settings(id) ON DELETE CASCADE;


--
-- Name: product_pricelist_res_config_settings_rel product_pricelist_res_config_settings_product_pricelist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist_res_config_settings_rel
    ADD CONSTRAINT product_pricelist_res_config_settings_product_pricelist_id_fkey FOREIGN KEY (product_pricelist_id) REFERENCES public.product_pricelist(id) ON DELETE CASCADE;


--
-- Name: product_pricelist product_pricelist_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_pricelist
    ADD CONSTRAINT product_pricelist_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_product product_product_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_product product_product_product_tmpl_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_product_tmpl_id_fkey FOREIGN KEY (product_tmpl_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_product_stock_track_confirmation_rel product_product_stock_track_co_stock_track_confirmation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_product_stock_track_confirmation_rel
    ADD CONSTRAINT product_product_stock_track_co_stock_track_confirmation_id_fkey FOREIGN KEY (stock_track_confirmation_id) REFERENCES public.stock_track_confirmation(id) ON DELETE CASCADE;


--
-- Name: product_product_stock_track_confirmation_rel product_product_stock_track_confirmatio_product_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_product_stock_track_confirmation_rel
    ADD CONSTRAINT product_product_stock_track_confirmatio_product_product_id_fkey FOREIGN KEY (product_product_id) REFERENCES public.product_product(id) ON DELETE CASCADE;


--
-- Name: product_product product_product_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_removal product_removal_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_removal
    ADD CONSTRAINT product_removal_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_removal product_removal_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_removal
    ADD CONSTRAINT product_removal_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_replenish product_replenish_bom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_replenish
    ADD CONSTRAINT product_replenish_bom_id_fkey FOREIGN KEY (bom_id) REFERENCES public.mrp_bom(id) ON DELETE SET NULL;


--
-- Name: product_replenish product_replenish_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_replenish
    ADD CONSTRAINT product_replenish_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.res_company(id) ON DELETE SET NULL;


--
-- Name: product_replenish product_replenish_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_replenish
    ADD CONSTRAINT product_replenish_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_replenish product_replenish_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_replenish
    ADD CONSTRAINT product_replenish_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product_product(id) ON DELETE CASCADE;


--
-- Name: product_replenish product_replenish_product_tmpl_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_replenish
    ADD CONSTRAINT product_replenish_product_tmpl_id_fkey FOREIGN KEY (product_tmpl_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_replenish product_replenish_product_uom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_replenish
    ADD CONSTRAINT product_replenish_product_uom_id_fkey FOREIGN KEY (product_uom_id) REFERENCES public.uom_uom(id) ON DELETE CASCADE;


--
-- Name: product_replenish product_replenish_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_replenish
    ADD CONSTRAINT product_replenish_route_id_fkey FOREIGN KEY (route_id) REFERENCES public.stock_route(id) ON DELETE SET NULL;


--
-- Name: product_replenish product_replenish_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_replenish
    ADD CONSTRAINT product_replenish_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.stock_warehouse(id) ON DELETE CASCADE;


--
-- Name: product_replenish product_replenish_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_replenish
    ADD CONSTRAINT product_replenish_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_supplier_taxes_rel product_supplier_taxes_rel_prod_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_supplier_taxes_rel
    ADD CONSTRAINT product_supplier_taxes_rel_prod_id_fkey FOREIGN KEY (prod_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_supplier_taxes_rel product_supplier_taxes_rel_tax_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_supplier_taxes_rel
    ADD CONSTRAINT product_supplier_taxes_rel_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.account_tax(id) ON DELETE CASCADE;


--
-- Name: product_supplierinfo product_supplierinfo_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_supplierinfo
    ADD CONSTRAINT product_supplierinfo_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.res_company(id) ON DELETE SET NULL;


--
-- Name: product_supplierinfo product_supplierinfo_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_supplierinfo
    ADD CONSTRAINT product_supplierinfo_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_supplierinfo product_supplierinfo_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_supplierinfo
    ADD CONSTRAINT product_supplierinfo_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES public.res_currency(id) ON DELETE RESTRICT;


--
-- Name: product_supplierinfo product_supplierinfo_partner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_supplierinfo
    ADD CONSTRAINT product_supplierinfo_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES public.res_partner(id) ON DELETE CASCADE;


--
-- Name: product_supplierinfo product_supplierinfo_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_supplierinfo
    ADD CONSTRAINT product_supplierinfo_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product_product(id) ON DELETE SET NULL;


--
-- Name: product_supplierinfo product_supplierinfo_product_tmpl_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_supplierinfo
    ADD CONSTRAINT product_supplierinfo_product_tmpl_id_fkey FOREIGN KEY (product_tmpl_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_supplierinfo product_supplierinfo_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_supplierinfo
    ADD CONSTRAINT product_supplierinfo_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_tag product_tag_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT product_tag_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_tag_product_product_rel product_tag_product_product_rel_product_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_tag_product_product_rel
    ADD CONSTRAINT product_tag_product_product_rel_product_product_id_fkey FOREIGN KEY (product_product_id) REFERENCES public.product_product(id) ON DELETE CASCADE;


--
-- Name: product_tag_product_product_rel product_tag_product_product_rel_product_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_tag_product_product_rel
    ADD CONSTRAINT product_tag_product_product_rel_product_tag_id_fkey FOREIGN KEY (product_tag_id) REFERENCES public.product_tag(id) ON DELETE CASCADE;


--
-- Name: product_tag_product_template_rel product_tag_product_template_rel_product_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_tag_product_template_rel
    ADD CONSTRAINT product_tag_product_template_rel_product_tag_id_fkey FOREIGN KEY (product_tag_id) REFERENCES public.product_tag(id) ON DELETE CASCADE;


--
-- Name: product_tag_product_template_rel product_tag_product_template_rel_product_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_tag_product_template_rel
    ADD CONSTRAINT product_tag_product_template_rel_product_template_id_fkey FOREIGN KEY (product_template_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_tag product_tag_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT product_tag_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_taxes_rel product_taxes_rel_prod_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_taxes_rel
    ADD CONSTRAINT product_taxes_rel_prod_id_fkey FOREIGN KEY (prod_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_taxes_rel product_taxes_rel_tax_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_taxes_rel
    ADD CONSTRAINT product_taxes_rel_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.account_tax(id) ON DELETE CASCADE;


--
-- Name: product_template_attribute_exclusion product_template_attribute_ex_product_template_attribute_v_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_exclusion
    ADD CONSTRAINT product_template_attribute_ex_product_template_attribute_v_fkey FOREIGN KEY (product_template_attribute_value_id) REFERENCES public.product_template_attribute_value(id) ON DELETE CASCADE;


--
-- Name: product_template_attribute_exclusion product_template_attribute_exclusion_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_exclusion
    ADD CONSTRAINT product_template_attribute_exclusion_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_template_attribute_exclusion product_template_attribute_exclusion_product_tmpl_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_exclusion
    ADD CONSTRAINT product_template_attribute_exclusion_product_tmpl_id_fkey FOREIGN KEY (product_tmpl_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_template_attribute_exclusion product_template_attribute_exclusion_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_exclusion
    ADD CONSTRAINT product_template_attribute_exclusion_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_template_attribute_line product_template_attribute_line_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_line
    ADD CONSTRAINT product_template_attribute_line_attribute_id_fkey FOREIGN KEY (attribute_id) REFERENCES public.product_attribute(id) ON DELETE RESTRICT;


--
-- Name: product_template_attribute_line product_template_attribute_line_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_line
    ADD CONSTRAINT product_template_attribute_line_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_template_attribute_line product_template_attribute_line_product_tmpl_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_line
    ADD CONSTRAINT product_template_attribute_line_product_tmpl_id_fkey FOREIGN KEY (product_tmpl_id) REFERENCES public.product_template(id) ON DELETE CASCADE;


--
-- Name: product_template_attribute_line product_template_attribute_line_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_line
    ADD CONSTRAINT product_template_attribute_line_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_template_attribute_value_sale_order_line_rel product_template_attribute_va_product_template_attribute_v_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_value_sale_order_line_rel
    ADD CONSTRAINT product_template_attribute_va_product_template_attribute_v_fkey FOREIGN KEY (product_template_attribute_value_id) REFERENCES public.product_template_attribute_value(id) ON DELETE RESTRICT;


--
-- Name: product_template_attribute_value product_template_attribute_valu_product_attribute_value_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_value
    ADD CONSTRAINT product_template_attribute_valu_product_attribute_value_id_fkey FOREIGN KEY (product_attribute_value_id) REFERENCES public.product_attribute_value(id) ON DELETE CASCADE;


--
-- Name: product_template_attribute_value product_template_attribute_value_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_value
    ADD CONSTRAINT product_template_attribute_value_attribute_id_fkey FOREIGN KEY (attribute_id) REFERENCES public.product_attribute(id) ON DELETE SET NULL;


--
-- Name: product_template_attribute_value product_template_attribute_value_attribute_line_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_value
    ADD CONSTRAINT product_template_attribute_value_attribute_line_id_fkey FOREIGN KEY (attribute_line_id) REFERENCES public.product_template_attribute_line(id) ON DELETE CASCADE;


--
-- Name: product_template_attribute_value product_template_attribute_value_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_value
    ADD CONSTRAINT product_template_attribute_value_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_template_attribute_value product_template_attribute_value_product_tmpl_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_value
    ADD CONSTRAINT product_template_attribute_value_product_tmpl_id_fkey FOREIGN KEY (product_tmpl_id) REFERENCES public.product_template(id) ON DELETE SET NULL;


--
-- Name: product_template_attribute_value_sale_order_line_rel product_template_attribute_value_sale_o_sale_order_line_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_value_sale_order_line_rel
    ADD CONSTRAINT product_template_attribute_value_sale_o_sale_order_line_id_fkey FOREIGN KEY (sale_order_line_id) REFERENCES public.sale_order_line(id) ON DELETE CASCADE;


--
-- Name: product_template_attribute_value product_template_attribute_value_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template_attribute_value
    ADD CONSTRAINT product_template_attribute_value_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_template product_template_categ_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template
    ADD CONSTRAINT product_template_categ_id_fkey FOREIGN KEY (categ_id) REFERENCES public.product_category(id) ON DELETE RESTRICT;


--
-- Name: product_template product_template_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template
    ADD CONSTRAINT product_template_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.res_company(id) ON DELETE SET NULL;


--
-- Name: product_template product_template_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template
    ADD CONSTRAINT product_template_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_template product_template_uom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template
    ADD CONSTRAINT product_template_uom_id_fkey FOREIGN KEY (uom_id) REFERENCES public.uom_uom(id) ON DELETE RESTRICT;


--
-- Name: product_template product_template_uom_po_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template
    ADD CONSTRAINT product_template_uom_po_id_fkey FOREIGN KEY (uom_po_id) REFERENCES public.uom_uom(id) ON DELETE RESTRICT;


--
-- Name: product_template product_template_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_template
    ADD CONSTRAINT product_template_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: product_variant_combination product_variant_combination_product_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_variant_combination
    ADD CONSTRAINT product_variant_combination_product_product_id_fkey FOREIGN KEY (product_product_id) REFERENCES public.product_product(id) ON DELETE CASCADE;


--
-- Name: product_variant_combination product_variant_combination_product_template_attribute_val_fkey; Type: FK CONSTRAINT; Schema: public; Owner: felipe
--

ALTER TABLE ONLY public.product_variant_combination
    ADD CONSTRAINT product_variant_combination_product_template_attribute_val_fkey FOREIGN KEY (product_template_attribute_value_id) REFERENCES public.product_template_attribute_value(id) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

