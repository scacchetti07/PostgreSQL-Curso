--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9
-- Dumped by pg_dump version 16.9

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
-- Name: aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluno (
    idaluno integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.aluno OWNER TO postgres;

--
-- Name: aluno_idaluno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aluno_idaluno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aluno_idaluno_seq OWNER TO postgres;

--
-- Name: aluno_idaluno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aluno_idaluno_seq OWNED BY public.aluno.idaluno;


--
-- Name: autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor (
    idautor integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.autor OWNER TO postgres;

--
-- Name: autor_idautor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autor_idautor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.autor_idautor_seq OWNER TO postgres;

--
-- Name: autor_idautor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autor_idautor_seq OWNED BY public.autor.idautor;


--
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    idcategoria integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- Name: categoria_idcategoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_idcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_idcategoria_seq OWNER TO postgres;

--
-- Name: categoria_idcategoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_idcategoria_seq OWNED BY public.categoria.idcategoria;


--
-- Name: editora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editora (
    ideditora integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.editora OWNER TO postgres;

--
-- Name: editora_ideditora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.editora_ideditora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.editora_ideditora_seq OWNER TO postgres;

--
-- Name: editora_ideditora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editora_ideditora_seq OWNED BY public.editora.ideditora;


--
-- Name: emprestimo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emprestimo (
    idemprestimo integer NOT NULL,
    idaluno integer NOT NULL,
    data_emprestimo date DEFAULT CURRENT_DATE NOT NULL,
    data_devolucao date NOT NULL,
    valor numeric DEFAULT 0 NOT NULL,
    devolvido character(1) NOT NULL
);


ALTER TABLE public.emprestimo OWNER TO postgres;

--
-- Name: emprestimo_idemprestimo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emprestimo_idemprestimo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emprestimo_idemprestimo_seq OWNER TO postgres;

--
-- Name: emprestimo_idemprestimo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emprestimo_idemprestimo_seq OWNED BY public.emprestimo.idemprestimo;


--
-- Name: emprestimo_livro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emprestimo_livro (
    idemprestimo integer NOT NULL,
    idlivro integer NOT NULL
);


ALTER TABLE public.emprestimo_livro OWNER TO postgres;

--
-- Name: livro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livro (
    idlivro integer NOT NULL,
    ideditora integer NOT NULL,
    idcategoria integer NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.livro OWNER TO postgres;

--
-- Name: livro_autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livro_autor (
    idlivro integer NOT NULL,
    idautor integer NOT NULL
);


ALTER TABLE public.livro_autor OWNER TO postgres;

--
-- Name: livro_autor_infos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.livro_autor_infos AS
 SELECT liv.nome AS livro,
    aut.nome AS autor
   FROM ((public.livro_autor lva
     LEFT JOIN public.livro liv ON ((lva.idlivro = liv.idlivro)))
     LEFT JOIN public.autor aut ON ((lva.idautor = aut.idautor)));


ALTER VIEW public.livro_autor_infos OWNER TO postgres;

--
-- Name: livro_idlivro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.livro_idlivro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.livro_idlivro_seq OWNER TO postgres;

--
-- Name: livro_idlivro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.livro_idlivro_seq OWNED BY public.livro.idlivro;


--
-- Name: livro_infos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.livro_infos AS
 SELECT liv.nome AS livro,
    cat.nome AS categoria,
    edt.nome AS editora
   FROM ((public.livro liv
     LEFT JOIN public.categoria cat ON ((liv.idcategoria = cat.idcategoria)))
     LEFT JOIN public.editora edt ON ((liv.ideditora = edt.ideditora)));


ALTER VIEW public.livro_infos OWNER TO postgres;

--
-- Name: aluno idaluno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno ALTER COLUMN idaluno SET DEFAULT nextval('public.aluno_idaluno_seq'::regclass);


--
-- Name: autor idautor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor ALTER COLUMN idautor SET DEFAULT nextval('public.autor_idautor_seq'::regclass);


--
-- Name: categoria idcategoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN idcategoria SET DEFAULT nextval('public.categoria_idcategoria_seq'::regclass);


--
-- Name: editora ideditora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editora ALTER COLUMN ideditora SET DEFAULT nextval('public.editora_ideditora_seq'::regclass);


--
-- Name: emprestimo idemprestimo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emprestimo ALTER COLUMN idemprestimo SET DEFAULT nextval('public.emprestimo_idemprestimo_seq'::regclass);


--
-- Name: livro idlivro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livro ALTER COLUMN idlivro SET DEFAULT nextval('public.livro_idlivro_seq'::regclass);


--
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aluno (idaluno, nome) FROM stdin;
1	Mário
2	João
3	Paulo
4	Pedro
5	Maria
\.


--
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autor (idautor, nome) FROM stdin;
1	Waldemar Setzer
2	Flávio Soares
3	John Watson
4	Rui Rossi dos Santos
5	Antonio Pereira de Resende
6	Claudiney Calixto Lima
7	Evandro Carlos Teruel
8	Ian Graham
9	Fabrício Xavier
10	Pablo Dalioglio
\.


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (idcategoria, nome) FROM stdin;
1	Banco de Dados
2	HTML
3	Java
4	PHP
\.


--
-- Data for Name: editora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editora (ideditora, nome) FROM stdin;
1	Bookman
2	Edgard Blusher
3	Nova Terra
4	Brasport
\.


--
-- Data for Name: emprestimo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emprestimo (idemprestimo, idaluno, data_emprestimo, data_devolucao, valor, devolvido) FROM stdin;
1	1	2012-05-02	2012-05-12	10	S
2	1	2012-04-23	2012-05-03	5	N
3	2	2012-05-10	2012-05-20	12	N
4	3	2012-05-10	2012-05-20	8	S
5	4	2012-05-05	2012-05-15	15	N
6	4	2012-05-07	2012-05-17	20	S
7	4	2012-05-08	2012-05-18	5	S
\.


--
-- Data for Name: emprestimo_livro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emprestimo_livro (idemprestimo, idlivro) FROM stdin;
1	1
2	4
2	3
3	2
3	7
4	5
5	4
6	6
6	1
7	8
\.


--
-- Data for Name: livro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.livro (idlivro, ideditora, idcategoria, nome) FROM stdin;
1	2	1	Banco de Dados - 1 Edição
2	1	1	Oracle DataBase 11G Administração
8	2	4	PHP com Programação Orientada a Objetos
3	3	3	Programação de Computadores Java
4	4	3	Programação Orientada a Aspectos em Java
5	4	2	HTML5 - Guia Prático
6	3	2	XHTML: Guia de Referência para Desenvolvimento na Web
7	1	4	PHP para Desenvolvimento profissonal
\.


--
-- Data for Name: livro_autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.livro_autor (idlivro, idautor) FROM stdin;
1	1
1	2
2	3
3	4
4	5
4	6
5	7
6	8
7	9
8	10
\.


--
-- Name: aluno_idaluno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aluno_idaluno_seq', 5, true);


--
-- Name: autor_idautor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autor_idautor_seq', 10, true);


--
-- Name: categoria_idcategoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_idcategoria_seq', 4, true);


--
-- Name: editora_ideditora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editora_ideditora_seq', 4, true);


--
-- Name: emprestimo_idemprestimo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emprestimo_idemprestimo_seq', 8, true);


--
-- Name: livro_idlivro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.livro_idlivro_seq', 8, true);


--
-- Name: aluno pk_aln_idaluno; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT pk_aln_idaluno PRIMARY KEY (idaluno);


--
-- Name: autor pk_aut_idautor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT pk_aut_idautor PRIMARY KEY (idautor);


--
-- Name: categoria pk_ctg_idcategoria; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT pk_ctg_idcategoria PRIMARY KEY (idcategoria);


--
-- Name: editora pk_edt_ideditora; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editora
    ADD CONSTRAINT pk_edt_ideditora PRIMARY KEY (ideditora);


--
-- Name: emprestimo pk_emp_idemprestimo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emprestimo
    ADD CONSTRAINT pk_emp_idemprestimo PRIMARY KEY (idemprestimo);


--
-- Name: emprestimo_livro pk_epl_idemprestimolivro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emprestimo_livro
    ADD CONSTRAINT pk_epl_idemprestimolivro PRIMARY KEY (idemprestimo, idlivro);


--
-- Name: livro_autor pk_lva_idlivroautor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livro_autor
    ADD CONSTRAINT pk_lva_idlivroautor PRIMARY KEY (idlivro, idautor);


--
-- Name: livro pk_lvr_idlivro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livro
    ADD CONSTRAINT pk_lvr_idlivro PRIMARY KEY (idlivro);


--
-- Name: categoria un_ctg_nome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT un_ctg_nome UNIQUE (nome);


--
-- Name: editora un_edt_nome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editora
    ADD CONSTRAINT un_edt_nome UNIQUE (nome);


--
-- Name: livro un_lvr_nome; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livro
    ADD CONSTRAINT un_lvr_nome UNIQUE (nome);


--
-- Name: idx_emp_devolucao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_emp_devolucao ON public.emprestimo USING btree (data_devolucao);


--
-- Name: idx_emp_emprestimo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_emp_emprestimo ON public.emprestimo USING btree (data_emprestimo);


--
-- Name: emprestimo fk_emp_idaluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emprestimo
    ADD CONSTRAINT fk_emp_idaluno FOREIGN KEY (idaluno) REFERENCES public.aluno(idaluno);


--
-- Name: emprestimo_livro fk_epl_idemprestimo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emprestimo_livro
    ADD CONSTRAINT fk_epl_idemprestimo FOREIGN KEY (idemprestimo) REFERENCES public.emprestimo(idemprestimo);


--
-- Name: emprestimo_livro fk_epl_idlivro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emprestimo_livro
    ADD CONSTRAINT fk_epl_idlivro FOREIGN KEY (idlivro) REFERENCES public.livro(idlivro);


--
-- Name: livro_autor fk_lva_idautor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livro_autor
    ADD CONSTRAINT fk_lva_idautor FOREIGN KEY (idautor) REFERENCES public.autor(idautor);


--
-- Name: livro_autor fk_lva_idlivro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livro_autor
    ADD CONSTRAINT fk_lva_idlivro FOREIGN KEY (idlivro) REFERENCES public.livro(idlivro);


--
-- Name: livro fk_lvr_idcategoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livro
    ADD CONSTRAINT fk_lvr_idcategoria FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria);


--
-- Name: livro fk_lvr_ideditora; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livro
    ADD CONSTRAINT fk_lvr_ideditora FOREIGN KEY (ideditora) REFERENCES public.editora(ideditora);


--
-- PostgreSQL database dump complete
--

