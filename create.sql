CREATE TABLE public."Player"
(
    id character varying(20) NOT NULL,
    rating integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."Opening"
(
    code character varying(5) NOT NULL,
    name character varying(100) NOT NULL,
    ply integer NOT NULL,
    PRIMARY KEY (code)
);


CREATE TABLE public."Game"
(
    id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint NOT NULL,
    all_moves text COLLATE pg_catalog."default" NOT NULL,
    game_status character varying(20) COLLATE pg_catalog."default" NOT NULL,
    winner character varying(20) COLLATE pg_catalog."default" NOT NULL,
    time_increment integer NOT NULL,
    white_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    black_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    opening_code character varying(5) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Game_pkey" PRIMARY KEY (id),
    CONSTRAINT black_id FOREIGN KEY (black_id)
        REFERENCES public."Player" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT opening_code FOREIGN KEY (opening_code)
        REFERENCES public."Opening" (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT white_id FOREIGN KEY (white_id)
        REFERENCES public."Player" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
);
        ON DELETE NO ACTION
)

