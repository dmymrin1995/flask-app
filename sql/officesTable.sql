CREATE TABLE IF NOT EXISTS public.offices
(
    id integer NOT NULL DEFAULT nextval('offices_id_seq'::regclass),
    office_code character varying(15) COLLATE pg_catalog."default" NOT NULL,
    head_office character varying(15) COLLATE pg_catalog."default" NOT NULL,
    office_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    office_type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    office_adress text COLLATE pg_catalog."default" NOT NULL,
    office_coords character varying(128) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT offices_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.work_time
(
    work_time_id integer NOT NULL DEFAULT nextval('work_time_work_time_id_seq'::regclass),
    office_id integer NOT NULL DEFAULT nextval('work_time_work_time_id_seq'::regclass),
    work_days character varying(128) COLLATE pg_catalog."default",
    work_time character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT work_time_pkey PRIMARY KEY (work_time_id),
    CONSTRAINT office_id FOREIGN KEY (office_id)
        REFERENCES public.offices (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)