PGDMP               	        |         	   flasktest    16.0    16.0     	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    28279 	   flasktest    DATABASE        CREATE DATABASE flasktest WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE flasktest;
                postgres    false            �            1259    28323    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            �            1259    28287    direcciones    TABLE     �   CREATE TABLE public.direcciones (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    calle character varying NOT NULL,
    ciudad character varying NOT NULL,
    estado character varying NOT NULL,
    pais character varying NOT NULL
);
    DROP TABLE public.direcciones;
       public         heap    postgres    false            �            1259    28332    direcciones_id_seq    SEQUENCE     {   CREATE SEQUENCE public.direcciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.direcciones_id_seq;
       public          postgres    false    216                       0    0    direcciones_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.direcciones_id_seq OWNED BY public.direcciones.id;
          public          postgres    false    220            �            1259    28301    experiencia_laboral    TABLE       CREATE TABLE public.experiencia_laboral (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    empresa character varying NOT NULL,
    puesto character varying NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date,
    responsabilidades text
);
 '   DROP TABLE public.experiencia_laboral;
       public         heap    postgres    false            �            1259    28333    experiencia_laboral_id_seq    SEQUENCE     �   CREATE SEQUENCE public.experiencia_laboral_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.experiencia_laboral_id_seq;
       public          postgres    false    218                       0    0    experiencia_laboral_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.experiencia_laboral_id_seq OWNED BY public.experiencia_laboral.id;
          public          postgres    false    221            �            1259    28294 	   telefonos    TABLE     �   CREATE TABLE public.telefonos (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    numero_telefono character varying NOT NULL
);
    DROP TABLE public.telefonos;
       public         heap    postgres    false            �            1259    28334    telefonos_id_seq    SEQUENCE     y   CREATE SEQUENCE public.telefonos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.telefonos_id_seq;
       public          postgres    false    217                       0    0    telefonos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.telefonos_id_seq OWNED BY public.telefonos.id;
          public          postgres    false    222            �            1259    28280    usuarios    TABLE     	  CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    email character varying NOT NULL,
    fecha_registro timestamp without time zone,
    username character varying NOT NULL,
    password character varying NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    28335    usuarios_id_seq    SEQUENCE     x   CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    215                       0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    223            d           2604    28336    direcciones id    DEFAULT     p   ALTER TABLE ONLY public.direcciones ALTER COLUMN id SET DEFAULT nextval('public.direcciones_id_seq'::regclass);
 =   ALTER TABLE public.direcciones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    216            f           2604    28337    experiencia_laboral id    DEFAULT     �   ALTER TABLE ONLY public.experiencia_laboral ALTER COLUMN id SET DEFAULT nextval('public.experiencia_laboral_id_seq'::regclass);
 E   ALTER TABLE public.experiencia_laboral ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    218            e           2604    28338    telefonos id    DEFAULT     l   ALTER TABLE ONLY public.telefonos ALTER COLUMN id SET DEFAULT nextval('public.telefonos_id_seq'::regclass);
 ;   ALTER TABLE public.telefonos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    217            c           2604    28339    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    215            t           2606    28327 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    219            n           2606    28293    direcciones direcciones_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT direcciones_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.direcciones DROP CONSTRAINT direcciones_pkey;
       public            postgres    false    216            r           2606    28307 ,   experiencia_laboral experiencia_laboral_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.experiencia_laboral
    ADD CONSTRAINT experiencia_laboral_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.experiencia_laboral DROP CONSTRAINT experiencia_laboral_pkey;
       public            postgres    false    218            p           2606    28300    telefonos telefonos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.telefonos
    ADD CONSTRAINT telefonos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.telefonos DROP CONSTRAINT telefonos_pkey;
       public            postgres    false    217            h           2606    28329    usuarios usuarios_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_email_key;
       public            postgres    false    215            j           2606    28286    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    215            l           2606    28331    usuarios usuarios_username_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_username_key UNIQUE (username);
 H   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_username_key;
       public            postgres    false    215            u           2606    28308 '   direcciones direcciones_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT direcciones_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 Q   ALTER TABLE ONLY public.direcciones DROP CONSTRAINT direcciones_usuario_id_fkey;
       public          postgres    false    215    4714    216            w           2606    28318 7   experiencia_laboral experiencia_laboral_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.experiencia_laboral
    ADD CONSTRAINT experiencia_laboral_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 a   ALTER TABLE ONLY public.experiencia_laboral DROP CONSTRAINT experiencia_laboral_usuario_id_fkey;
       public          postgres    false    215    218    4714            v           2606    28313 #   telefonos telefonos_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.telefonos
    ADD CONSTRAINT telefonos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 M   ALTER TABLE ONLY public.telefonos DROP CONSTRAINT telefonos_usuario_id_fkey;
       public          postgres    false    215    217    4714           