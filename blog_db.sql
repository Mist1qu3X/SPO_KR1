--
-- PostgreSQL database dump
--

\restrict QGYkVgw6F2ubYTeOupnGEa4p5fnhBPvW0cK34DKJjU1nm8DPjS8oJPDsFjsjW8g

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    content text NOT NULL,
    post_id integer NOT NULL,
    author_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: post_likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.post_likes (
    user_id integer NOT NULL,
    post_id integer NOT NULL
);


--
-- Name: post_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.post_tags (
    post_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    author_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    role character varying(20) DEFAULT 'user'::character varying NOT NULL,
    avatar_url text
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.comments (id, content, post_id, author_id, created_at) FROM stdin;
1	Отличный старт!	1	2	2026-09-23 21:15:24.168545
2	Согласен, React топ.	2	1	2026-09-23 21:15:24.168545
5	ВААААУ!!!	2	3	2026-09-23 21:33:43.19078
6	<З	5	4	2026-09-23 23:19:31.538926
\.


--
-- Data for Name: post_likes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.post_likes (user_id, post_id) FROM stdin;
1	2
2	1
5	1
5	2
4	5
4	2
4	1
5	5
\.


--
-- Data for Name: post_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.post_tags (post_id, tag_id) FROM stdin;
1	1
1	3
2	2
5	7
6	8
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.posts (id, title, content, author_id, created_at, updated_at) FROM stdin;
1	Первый пост в блоге	Привет! Это демонстрационный пост нашей блог-платформы.\nЗдесь можно писать статьи, ставить теги и оставлять комментарии.	1	2026-09-23 21:15:24.168545	2026-09-23 21:15:24.168545
2	Почему я люблю React	React делает создание интерфейсов простым и предсказуемым. Компонентный подход — это удобно.	2	2026-09-23 21:15:24.168545	2026-09-23 21:15:24.168545
5	Это мой тестовый блог	Я тестирую свой проект	4	2026-09-23 22:04:13.569261	2026-09-23 22:04:13.569261
6	Я Admin	Я могу всё	5	2026-09-23 23:21:08.232003	2026-09-23 23:21:08.232003
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tags (id, name) FROM stdin;
1	python
2	react
3	жизнь
7	live
8	admin
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, email, password_hash, created_at, role, avatar_url) FROM stdin;
1	alice	alice@example.com	$2b$12$yxzjJo7jz0K2tmIxbSumpuLxojEa/46K9sYEXMOBQOq9ajej.eOtm	2026-09-23 21:15:24.168545	user	\N
3	Mist1qu3X	rturdahunov@bk.ru	$2b$12$NOSFJiaU7BJwF40FAaAYBuJa97ll4gASdU03P9.Etb87H.pGJuEiS	2026-09-23 21:33:25.421614	user	\N
5	admin	admin@example.com	$2b$12$R6cAHKvhcnJQAe9jN.EgFuJCBZpPpziH3.czafnjKtqlj9E9XQ9B.	2026-09-23 21:41:17.26472	admin	\N
2	bob	bob@example.com	$2b$12$c7c9VUt0qlokUEFhYqpiMOF9zcg7OgjY9rFctP37Ul2N5.I/nUi4a	2026-09-23 21:15:24.168545	user	\N
4	Flafff1x	admin@bk.ru	$2b$12$IWzMnH64ZyIOA.8rLt9VCOIi3TNbb8Z9UcYcNe9Xp6MF8e3RKxpai	2026-09-23 21:34:06.449717	user	data:image/jpeg;base64,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
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 7, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 6, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tags_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: post_likes post_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT post_likes_pkey PRIMARY KEY (user_id, post_id);


--
-- Name: post_tags post_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_pkey PRIMARY KEY (post_id, tag_id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_post_likes_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_post_likes_post_id ON public.post_likes USING btree (post_id);


--
-- Name: ix_comments_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_comments_author_id ON public.comments USING btree (author_id);


--
-- Name: ix_comments_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_comments_id ON public.comments USING btree (id);


--
-- Name: ix_comments_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_comments_post_id ON public.comments USING btree (post_id);


--
-- Name: ix_posts_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_posts_author_id ON public.posts USING btree (author_id);


--
-- Name: ix_posts_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_posts_id ON public.posts USING btree (id);


--
-- Name: ix_tags_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_tags_id ON public.tags USING btree (id);


--
-- Name: ix_tags_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_tags_name ON public.tags USING btree (name);


--
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_users_email ON public.users USING btree (email);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: ix_users_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_users_username ON public.users USING btree (username);


--
-- Name: comments comments_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: post_likes post_likes_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT post_likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: post_likes post_likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT post_likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: post_tags post_tags_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: post_tags post_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- Name: posts posts_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict QGYkVgw6F2ubYTeOupnGEa4p5fnhBPvW0cK34DKJjU1nm8DPjS8oJPDsFjsjW8g

