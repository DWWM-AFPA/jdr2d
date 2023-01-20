PGDMP                          {            jdr2d_matthieu    14.1 (Debian 14.1-1.pgdg110+1)    15.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16654    jdr2d_matthieu    DATABASE     y   CREATE DATABASE jdr2d_matthieu WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE jdr2d_matthieu;
                mballand    false            �           0    0    DATABASE jdr2d_matthieu    ACL     5   GRANT CONNECT ON DATABASE jdr2d_matthieu TO ykohler;
                   mballand    false    3975                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    7                        3079    38949 
   btree_gist 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;
    DROP EXTENSION btree_gist;
                   false    7            �           0    0    EXTENSION btree_gist    COMMENT     T   COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';
                        false    3                        3079    38912    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                   false    7            �           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    2            �           1255    39575 V   add_player(character varying, character varying, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.add_player(name character varying, email character varying, passwd character varying, passwd2 character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
  DECLARE
        iterations INTEGER;
        algo VARCHAR;
        idplayer BIGINT;
      BEGIN
        IF passwd <> passwd2 THEN
          RAISE NOTICE 'Different passwords, I don''t create the player';
          RETURN FALSE;
        ELSE
          BEGIN

            SELECT "Value"::INTEGER INTO iterations FROM "Option" WHERE "Section"='CRYPT' AND "Part"='ITERATIONS';
            SELECT "Value" INTO algo FROM "Option" WHERE "Section"='CRYPT' AND "Part"='ALGORITHM';
            INSERT INTO "player" ("Name", "Email", "Password","valide")
            VALUES
                        (name, email, crypt(passwd, gen_salt(algo, iterations)),'f')
            RETURNING "Id" INTO idplayer;

            RETURN TRUE;
          EXCEPTION
            WHEN OTHERS THEN
              CREATE TABLE IF NOT EXISTS "Log" (id serial,"Msg" VARCHAR(255),"LogDate" timestamp);
              INSERT INTO "Log" ("Msg", "LogDate") VALUES(CONCAT(SQLSTATE,' ', SQLERRM), NOW());
              CALL reset_seq_id('player');
              RETURN FALSE;
              END;
        END IF;
      END;
$$;
 �   DROP FUNCTION public.add_player(name character varying, email character varying, passwd character varying, passwd2 character varying);
       public          mballand    false    7            �           1255    39574    drop_triggers() 	   PROCEDURE     6  CREATE PROCEDURE public.drop_triggers()
    LANGUAGE plpgsql
    AS $$
DECLARE
  r record;
  s TEXT;
BEGIN
  BEGIN
    FOR r IN SELECT trigger_schema,trigger_name
             FROM information_schema.triggers
             WHERE trigger_schema = 'public'
    LOOP
      s := 'DROP TRIGGER ' ||  quote_ident(r.table_schema) || '.' || quote_ident(r.table_name) || ';';

      RAISE NOTICE 's = % ',s;
      EXECUTE s;
    END LOOP;
  END;
  EXCEPTION
    WHEN OTHERS THEN
      INSERT INTO "Log"("Msg", "LogDate") VALUES(CONCAT(SQLSTATE,' ', SQLERRM), NOW());
END;
$$;
 '   DROP PROCEDURE public.drop_triggers();
       public          mballand    false    7            �           1255    39573    drop_views() 	   PROCEDURE       CREATE PROCEDURE public.drop_views()
    LANGUAGE plpgsql
    AS $$
DECLARE
  r record;
  s TEXT;
BEGIN
  BEGIN
    FOR r IN SELECT table_schema,table_name
             FROM information_schema.views
             WHERE table_schema = 'public'
    LOOP
      s := 'DROP VIEW ' ||  quote_ident(r.table_schema) || '.' || quote_ident(r.table_name) || ';';

      EXECUTE s;
    END LOOP;
  END;
  EXCEPTION
    WHEN OTHERS THEN
      INSERT INTO "Log"("Msg", "LogDate") VALUES(CONCAT(SQLSTATE,' ', SQLERRM), NOW());
END;
$$;
 $   DROP PROCEDURE public.drop_views();
       public          mballand    false    7            �           1255    39572    reset_seq_id(character varying) 	   PROCEDURE       CREATE PROCEDURE public.reset_seq_id(IN tbl character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
  seqname VARCHAR;
BEGIN
  SELECT s.seqname INTO seqname FROM sequences s WHERE colname='Id' AND tblname=tbl;
  PERFORM setval(seqname, 1, false);
END;
$$;
 >   DROP PROCEDURE public.reset_seq_id(IN tbl character varying);
       public          mballand    false    7                        1259    53355    Log    TABLE     �   CREATE TABLE public."Log" (
    id integer NOT NULL,
    "Msg" character varying(255),
    "LogDate" timestamp without time zone
);
    DROP TABLE public."Log";
       public         heap    mballand    false    7            �            1259    53354 
   Log_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Log_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public."Log_id_seq";
       public          mballand    false    256    7            �           0    0 
   Log_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public."Log_id_seq" OWNED BY public."Log".id;
          public          mballand    false    255                       1259    53385    Option    TABLE     �   CREATE TABLE public."Option" (
    "Section" character varying(255) NOT NULL,
    "Part" character varying(255) NOT NULL,
    "Value" character varying(255) NOT NULL
);
    DROP TABLE public."Option";
       public         heap    mballand    false    7                       1259    53439    Player    TABLE       CREATE TABLE public."Player" (
    id_compte_utilisateur integer NOT NULL,
    "Name" character varying(255) NOT NULL,
    "Email" character varying(255) NOT NULL,
    "Password" character varying(255) NOT NULL,
    valide character varying(255) NOT NULL
);
    DROP TABLE public."Player";
       public         heap    mballand    false    7                       1259    53376    Section    TABLE     z   CREATE TABLE public."Section" (
    "Code" character varying(255) NOT NULL,
    "Name" character varying(255) NOT NULL
);
    DROP TABLE public."Section";
       public         heap    mballand    false    7                       1259    54530    a_testcarte    TABLE     C   CREATE TABLE public.a_testcarte (
    id_carte integer NOT NULL
);
    DROP TABLE public.a_testcarte;
       public         heap    mballand    false    7                       1259    54529    a_testcarte_id_carte_seq    SEQUENCE     �   CREATE SEQUENCE public.a_testcarte_id_carte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.a_testcarte_id_carte_seq;
       public          mballand    false    7    261            �           0    0    a_testcarte_id_carte_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.a_testcarte_id_carte_seq OWNED BY public.a_testcarte.id_carte;
          public          mballand    false    260            	           1259    54549    a_testobjet    TABLE     \   CREATE TABLE public.a_testobjet (
    id_objet integer NOT NULL,
    id_position integer
);
    DROP TABLE public.a_testobjet;
       public         heap    mballand    false    7                       1259    54548    a_testobjet_id_objet_seq    SEQUENCE     �   CREATE SEQUENCE public.a_testobjet_id_objet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.a_testobjet_id_objet_seq;
       public          mballand    false    265    7            �           0    0    a_testobjet_id_objet_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.a_testobjet_id_objet_seq OWNED BY public.a_testobjet.id_objet;
          public          mballand    false    264                       1259    54563    a_testperso    TABLE     \   CREATE TABLE public.a_testperso (
    id_perso integer NOT NULL,
    id_position integer
);
    DROP TABLE public.a_testperso;
       public         heap    mballand    false    7            
           1259    54562    a_testperso_id_perso_seq    SEQUENCE     �   CREATE SEQUENCE public.a_testperso_id_perso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.a_testperso_id_perso_seq;
       public          mballand    false    267    7            �           0    0    a_testperso_id_perso_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.a_testperso_id_perso_seq OWNED BY public.a_testperso.id_perso;
          public          mballand    false    266                       1259    54537 	   a_testpos    TABLE     Z   CREATE TABLE public.a_testpos (
    id_position integer NOT NULL,
    id_carte integer
);
    DROP TABLE public.a_testpos;
       public         heap    mballand    false    7                       1259    54536    a_testpos_id_position_seq    SEQUENCE     �   CREATE SEQUENCE public.a_testpos_id_position_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.a_testpos_id_position_seq;
       public          mballand    false    263    7            �           0    0    a_testpos_id_position_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.a_testpos_id_position_seq OWNED BY public.a_testpos.id_position;
          public          mballand    false    262            �            1259    21432    accorde    TABLE     y   CREATE TABLE public.accorde (
    id_objet integer NOT NULL,
    id_recompense integer NOT NULL,
    quantite integer
);
    DROP TABLE public.accorde;
       public         heap    mballand    false    7            �            1259    22058    active    TABLE     c   CREATE TABLE public.active (
    id_objet integer NOT NULL,
    id_interaction integer NOT NULL
);
    DROP TABLE public.active;
       public         heap    mballand    false    7            �            1259    21377    affecte    TABLE     m   CREATE TABLE public.affecte (
    id_personnage integer NOT NULL,
    id_etat_personnage integer NOT NULL
);
    DROP TABLE public.affecte;
       public         heap    mballand    false    7            �            1259    21068 
   appartient    TABLE     g   CREATE TABLE public.appartient (
    id_personnage integer NOT NULL,
    id_classe integer NOT NULL
);
    DROP TABLE public.appartient;
       public         heap    mballand    false    7            �            1259    20243    aptitude    TABLE       CREATE TABLE public.aptitude (
    id_aptitude integer NOT NULL,
    nom_aptitude character varying(255),
    effet_aptitude character varying(255),
    prerequis_aptitude character varying(255),
    id_type_aptitude integer,
    description character varying(255)
);
    DROP TABLE public.aptitude;
       public         heap    mballand    false    7            �            1259    20242    aptitude_id_aptitude_seq    SEQUENCE     �   CREATE SEQUENCE public.aptitude_id_aptitude_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.aptitude_id_aptitude_seq;
       public          mballand    false    218    7            �           0    0    aptitude_id_aptitude_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.aptitude_id_aptitude_seq OWNED BY public.aptitude.id_aptitude;
          public          mballand    false    217            �            1259    20325    caracteristique    TABLE     �   CREATE TABLE public.caracteristique (
    id_statistique integer NOT NULL,
    nom_caracteristique character varying(255),
    description_caracteristique text
);
 #   DROP TABLE public.caracteristique;
       public         heap    mballand    false    7            �            1259    20324 !   caracteristique_id_statistque_seq    SEQUENCE     �   CREATE SEQUENCE public.caracteristique_id_statistque_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.caracteristique_id_statistque_seq;
       public          mballand    false    220    7            �           0    0 !   caracteristique_id_statistque_seq    SEQUENCE OWNED BY     h   ALTER SEQUENCE public.caracteristique_id_statistque_seq OWNED BY public.caracteristique.id_statistique;
          public          mballand    false    219            �            1259    20143    classe    TABLE     �   CREATE TABLE public.classe (
    id_classe integer NOT NULL,
    nom_classe character varying(255) NOT NULL,
    description_classe text,
    jouable boolean
);
    DROP TABLE public.classe;
       public         heap    mballand    false    7            �            1259    20142    classe_id_classe_seq    SEQUENCE     �   CREATE SEQUENCE public.classe_id_classe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.classe_id_classe_seq;
       public          mballand    false    214    7            �           0    0    classe_id_classe_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.classe_id_classe_seq OWNED BY public.classe.id_classe;
          public          mballand    false    213            �            1259    20802 ,   compte_utilisateur_id_compte_utilisateur_seq    SEQUENCE     �   CREATE SEQUENCE public.compte_utilisateur_id_compte_utilisateur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.compte_utilisateur_id_compte_utilisateur_seq;
       public          mballand    false    7    259            �           0    0 ,   compte_utilisateur_id_compte_utilisateur_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.compte_utilisateur_id_compte_utilisateur_seq OWNED BY public."Player".id_compte_utilisateur;
          public          mballand    false    221            �            1259    21464 	   considere    TABLE     �   CREATE TABLE public.considere (
    id_personnage_juger integer NOT NULL,
    id_personnage_juge integer NOT NULL,
    aggressif boolean NOT NULL
);
    DROP TABLE public.considere;
       public         heap    mballand    false    7            �            1259    21222    contient    TABLE     ~   CREATE TABLE public.contient (
    contenant integer NOT NULL,
    id_objet_contenu integer NOT NULL,
    quantite integer
);
    DROP TABLE public.contient;
       public         heap    mballand    false    7            �            1259    21978 	   declenche    TABLE     �   CREATE TABLE public.declenche (
    id_interaction integer NOT NULL,
    id_recompense integer NOT NULL,
    id_objectif integer NOT NULL
);
    DROP TABLE public.declenche;
       public         heap    mballand    false    7            �            1259    21042    definit    TABLE     �   CREATE TABLE public.definit (
    id_personnage integer NOT NULL,
    id_statistique integer NOT NULL,
    valeur integer,
    valeur_max integer
);
    DROP TABLE public.definit;
       public         heap    mballand    false    7            �            1259    21364    dialogue    TABLE     �   CREATE TABLE public.dialogue (
    id_dialogue integer NOT NULL,
    contenu_dialogue text NOT NULL,
    id_personnage integer,
    caracteristique character varying(255)
);
    DROP TABLE public.dialogue;
       public         heap    mballand    false    7            �            1259    21363    dialogue_id_dialogue_seq    SEQUENCE     �   CREATE SEQUENCE public.dialogue_id_dialogue_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.dialogue_id_dialogue_seq;
       public          mballand    false    243    7            �           0    0    dialogue_id_dialogue_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.dialogue_id_dialogue_seq OWNED BY public.dialogue.id_dialogue;
          public          mballand    false    242            �            1259    22003    donne    TABLE     e   CREATE TABLE public.donne (
    id_interaction integer NOT NULL,
    id_dialogue integer NOT NULL
);
    DROP TABLE public.donne;
       public         heap    mballand    false    7            �            1259    21333    etat_personnage    TABLE     �   CREATE TABLE public.etat_personnage (
    id_etat_personnage integer NOT NULL,
    nom_etat character varying(255) NOT NULL,
    effet_etat character varying(255) NOT NULL,
    description_etat character varying(255)
);
 #   DROP TABLE public.etat_personnage;
       public         heap    mballand    false    7            �            1259    21332 &   etat_personnage_id_etat_personnage_seq    SEQUENCE     �   CREATE SEQUENCE public.etat_personnage_id_etat_personnage_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.etat_personnage_id_etat_personnage_seq;
       public          mballand    false    7    241            �           0    0 &   etat_personnage_id_etat_personnage_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.etat_personnage_id_etat_personnage_seq OWNED BY public.etat_personnage.id_etat_personnage;
          public          mballand    false    240            �            1259    21482    interaction    TABLE     6  CREATE TABLE public.interaction (
    id_interaction integer NOT NULL,
    prerequis_interaction character varying(255),
    nom_interaction character varying(255),
    description_interaction character varying(255),
    completion_interaction smallint NOT NULL,
    type_interaction character varying(255)
);
    DROP TABLE public.interaction;
       public         heap    mballand    false    7            �            1259    21481    interaction_id_interaction_seq    SEQUENCE     �   CREATE SEQUENCE public.interaction_id_interaction_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.interaction_id_interaction_seq;
       public          mballand    false    7    249            �           0    0    interaction_id_interaction_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.interaction_id_interaction_seq OWNED BY public.interaction.id_interaction;
          public          mballand    false    248            �            1259    20827    lieu    TABLE     �   CREATE TABLE public.lieu (
    id_lieu integer NOT NULL,
    nom_lieu character varying(255),
    description_lieu character varying(255),
    carte_lieu text
);
    DROP TABLE public.lieu;
       public         heap    mballand    false    7            �            1259    20826    lieu_id_lieu_seq    SEQUENCE     �   CREATE SEQUENCE public.lieu_id_lieu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.lieu_id_lieu_seq;
       public          mballand    false    7    224            �           0    0    lieu_id_lieu_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.lieu_id_lieu_seq OWNED BY public.lieu.id_lieu;
          public          mballand    false    223            �            1259    21292    maitrise    TABLE     �   CREATE TABLE public.maitrise (
    id_personnage integer NOT NULL,
    id_aptitude integer NOT NULL,
    pourcentage_maitrise integer NOT NULL
);
    DROP TABLE public.maitrise;
       public         heap    mballand    false    7            �            1259    33642    mene    TABLE     �   CREATE TABLE public.mene (
    choix text NOT NULL,
    caracteristique character varying(255),
    id_dialogue_suivant integer NOT NULL,
    id_dialogue_precedent integer NOT NULL
);
    DROP TABLE public.mene;
       public         heap    mballand    false    7            �            1259    21322    objectif    TABLE     �   CREATE TABLE public.objectif (
    id_objectif integer NOT NULL,
    nom_objectif character varying(255) NOT NULL,
    description_objectif text,
    validation character varying(255) NOT NULL
);
    DROP TABLE public.objectif;
       public         heap    mballand    false    7            �            1259    21321    objectif_id_objectif_seq    SEQUENCE     �   CREATE SEQUENCE public.objectif_id_objectif_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.objectif_id_objectif_seq;
       public          mballand    false    239    7            �           0    0    objectif_id_objectif_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.objectif_id_objectif_seq OWNED BY public.objectif.id_objectif;
          public          mballand    false    238            �            1259    21160    objet    TABLE     '  CREATE TABLE public.objet (
    id_objet integer NOT NULL,
    nom_objet character varying(255) NOT NULL,
    statistique_objet character varying(255),
    equipe boolean,
    ouvert boolean,
    description_objet text,
    prix integer,
    id_type_objet integer,
    poids integer NOT NULL
);
    DROP TABLE public.objet;
       public         heap    mballand    false    7            �            1259    21159    objet_id_objet_seq    SEQUENCE     �   CREATE SEQUENCE public.objet_id_objet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.objet_id_objet_seq;
       public          mballand    false    232    7            �           0    0    objet_id_objet_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.objet_id_objet_seq OWNED BY public.objet.id_objet;
          public          mballand    false    231            �            1259    20998 
   personnage    TABLE     f  CREATE TABLE public.personnage (
    id_personnage integer NOT NULL,
    nom_personnage character varying(255) NOT NULL,
    niveau_personnage smallint NOT NULL,
    direction character varying(255),
    alignement character varying(255),
    monnaie bigint,
    vivant boolean,
    id_race integer,
    id_compte_utilisateur integer,
    id_lieu integer
);
    DROP TABLE public.personnage;
       public         heap    mballand    false    7            �            1259    20997    personnage_id_personnage_seq    SEQUENCE     �   CREATE SEQUENCE public.personnage_id_personnage_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.personnage_id_personnage_seq;
       public          mballand    false    7    228            �           0    0    personnage_id_personnage_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.personnage_id_personnage_seq OWNED BY public.personnage.id_personnage;
          public          mballand    false    227            �            1259    20803    player    TABLE     1  CREATE TABLE public.player (
    "Id" integer DEFAULT nextval('public.compte_utilisateur_id_compte_utilisateur_seq'::regclass) NOT NULL,
    "Name" character varying(255) NOT NULL,
    "Email" character varying(255) NOT NULL,
    "Password" character varying(255) NOT NULL,
    valide boolean NOT NULL
);
    DROP TABLE public.player;
       public         heap    mballand    false    221    7            �            1259    21392    possede    TABLE     y   CREATE TABLE public.possede (
    id_personnage integer NOT NULL,
    id_objet integer NOT NULL,
    quantite integer
);
    DROP TABLE public.possede;
       public         heap    mballand    false    7            �            1259    20896    race    TABLE     �   CREATE TABLE public.race (
    id_race integer NOT NULL,
    nom_race character varying(255) NOT NULL,
    description_race text,
    jouable boolean
);
    DROP TABLE public.race;
       public         heap    mballand    false    7            �            1259    20895    race_id_race_seq    SEQUENCE     �   CREATE SEQUENCE public.race_id_race_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.race_id_race_seq;
       public          mballand    false    226    7            �           0    0    race_id_race_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.race_id_race_seq OWNED BY public.race.id_race;
          public          mballand    false    225            �            1259    21313 
   recompense    TABLE     �   CREATE TABLE public.recompense (
    id_recompense integer NOT NULL,
    nom_recompense character varying(255) NOT NULL,
    decription_recompense text
);
    DROP TABLE public.recompense;
       public         heap    mballand    false    7            �            1259    21312    recompense_id_recompense_seq    SEQUENCE     �   CREATE SEQUENCE public.recompense_id_recompense_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.recompense_id_recompense_seq;
       public          mballand    false    237    7            �           0    0    recompense_id_recompense_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.recompense_id_recompense_seq OWNED BY public.recompense.id_recompense;
          public          mballand    false    236            �            1259    21185    relie    TABLE     u   CREATE TABLE public.relie (
    id_objet_porte_entre integer NOT NULL,
    id_objet_porte_sortie integer NOT NULL
);
    DROP TABLE public.relie;
       public         heap    mballand    false    7            �            1259    52951 	   sequences    VIEW     �  CREATE VIEW public.sequences AS
 SELECT s.relname AS seqname,
    tbl.relname AS tblname,
    col.attname AS colname
   FROM ((((((pg_class s
     JOIN pg_namespace sn ON ((sn.oid = s.relnamespace)))
     JOIN pg_depend d ON (((d.refobjid = s.oid) AND (d.refclassid = ('pg_class'::regclass)::oid))))
     JOIN pg_attrdef ad ON (((ad.oid = d.objid) AND (d.classid = ('pg_attrdef'::regclass)::oid))))
     JOIN pg_attribute col ON (((col.attrelid = ad.adrelid) AND (col.attnum = ad.adnum))))
     JOIN pg_class tbl ON ((tbl.oid = ad.adrelid)))
     JOIN pg_namespace n ON ((n.oid = tbl.relnamespace)))
  WHERE ((s.relkind = 'S'::"char") AND (d.deptype = ANY (ARRAY['a'::"char", 'n'::"char"])) AND (n.nspname = 'public'::name));
    DROP VIEW public.sequences;
       public          mballand    false    7            �            1259    20154    type_aptitude    TABLE     �   CREATE TABLE public.type_aptitude (
    id_type_aptitude integer NOT NULL,
    nom_type_aptitude character varying(255) NOT NULL
);
 !   DROP TABLE public.type_aptitude;
       public         heap    mballand    false    7            �            1259    20153 "   type_aptitude_id_type_aptitude_seq    SEQUENCE     �   CREATE SEQUENCE public.type_aptitude_id_type_aptitude_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.type_aptitude_id_type_aptitude_seq;
       public          mballand    false    216    7            �           0    0 "   type_aptitude_id_type_aptitude_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.type_aptitude_id_type_aptitude_seq OWNED BY public.type_aptitude.id_type_aptitude;
          public          mballand    false    215            �            1259    16933 
   type_objet    TABLE     �   CREATE TABLE public.type_objet (
    id_type_objet integer NOT NULL,
    nom_type_objet character varying(255) NOT NULL,
    emplacement_objet character varying(255)
);
    DROP TABLE public.type_objet;
       public         heap    mballand    false    7            �            1259    16932    type_objet_id_type_objet_seq    SEQUENCE     �   CREATE SEQUENCE public.type_objet_id_type_objet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.type_objet_id_type_objet_seq;
       public          mballand    false    212    7            �           0    0    type_objet_id_type_objet_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.type_objet_id_type_objet_seq OWNED BY public.type_objet.id_type_objet;
          public          mballand    false    211            ;           2604    53444    Log id    DEFAULT     d   ALTER TABLE ONLY public."Log" ALTER COLUMN id SET DEFAULT nextval('public."Log_id_seq"'::regclass);
 7   ALTER TABLE public."Log" ALTER COLUMN id DROP DEFAULT;
       public          mballand    false    255    256    256            <           2604    53445    Player id_compte_utilisateur    DEFAULT     �   ALTER TABLE ONLY public."Player" ALTER COLUMN id_compte_utilisateur SET DEFAULT nextval('public.compte_utilisateur_id_compte_utilisateur_seq'::regclass);
 M   ALTER TABLE public."Player" ALTER COLUMN id_compte_utilisateur DROP DEFAULT;
       public          mballand    false    221    259    259            =           2604    54533    a_testcarte id_carte    DEFAULT     |   ALTER TABLE ONLY public.a_testcarte ALTER COLUMN id_carte SET DEFAULT nextval('public.a_testcarte_id_carte_seq'::regclass);
 C   ALTER TABLE public.a_testcarte ALTER COLUMN id_carte DROP DEFAULT;
       public          mballand    false    261    260    261            ?           2604    54552    a_testobjet id_objet    DEFAULT     |   ALTER TABLE ONLY public.a_testobjet ALTER COLUMN id_objet SET DEFAULT nextval('public.a_testobjet_id_objet_seq'::regclass);
 C   ALTER TABLE public.a_testobjet ALTER COLUMN id_objet DROP DEFAULT;
       public          mballand    false    265    264    265            @           2604    54566    a_testperso id_perso    DEFAULT     |   ALTER TABLE ONLY public.a_testperso ALTER COLUMN id_perso SET DEFAULT nextval('public.a_testperso_id_perso_seq'::regclass);
 C   ALTER TABLE public.a_testperso ALTER COLUMN id_perso DROP DEFAULT;
       public          mballand    false    266    267    267            >           2604    54540    a_testpos id_position    DEFAULT     ~   ALTER TABLE ONLY public.a_testpos ALTER COLUMN id_position SET DEFAULT nextval('public.a_testpos_id_position_seq'::regclass);
 D   ALTER TABLE public.a_testpos ALTER COLUMN id_position DROP DEFAULT;
       public          mballand    false    263    262    263            /           2604    53447    aptitude id_aptitude    DEFAULT     |   ALTER TABLE ONLY public.aptitude ALTER COLUMN id_aptitude SET DEFAULT nextval('public.aptitude_id_aptitude_seq'::regclass);
 C   ALTER TABLE public.aptitude ALTER COLUMN id_aptitude DROP DEFAULT;
       public          mballand    false    218    217    218            0           2604    53448    caracteristique id_statistique    DEFAULT     �   ALTER TABLE ONLY public.caracteristique ALTER COLUMN id_statistique SET DEFAULT nextval('public.caracteristique_id_statistque_seq'::regclass);
 M   ALTER TABLE public.caracteristique ALTER COLUMN id_statistique DROP DEFAULT;
       public          mballand    false    220    219    220            -           2604    53449    classe id_classe    DEFAULT     t   ALTER TABLE ONLY public.classe ALTER COLUMN id_classe SET DEFAULT nextval('public.classe_id_classe_seq'::regclass);
 ?   ALTER TABLE public.classe ALTER COLUMN id_classe DROP DEFAULT;
       public          mballand    false    214    213    214            9           2604    53450    dialogue id_dialogue    DEFAULT     |   ALTER TABLE ONLY public.dialogue ALTER COLUMN id_dialogue SET DEFAULT nextval('public.dialogue_id_dialogue_seq'::regclass);
 C   ALTER TABLE public.dialogue ALTER COLUMN id_dialogue DROP DEFAULT;
       public          mballand    false    242    243    243            8           2604    53451 "   etat_personnage id_etat_personnage    DEFAULT     �   ALTER TABLE ONLY public.etat_personnage ALTER COLUMN id_etat_personnage SET DEFAULT nextval('public.etat_personnage_id_etat_personnage_seq'::regclass);
 Q   ALTER TABLE public.etat_personnage ALTER COLUMN id_etat_personnage DROP DEFAULT;
       public          mballand    false    241    240    241            :           2604    53452    interaction id_interaction    DEFAULT     �   ALTER TABLE ONLY public.interaction ALTER COLUMN id_interaction SET DEFAULT nextval('public.interaction_id_interaction_seq'::regclass);
 I   ALTER TABLE public.interaction ALTER COLUMN id_interaction DROP DEFAULT;
       public          mballand    false    248    249    249            2           2604    53453    lieu id_lieu    DEFAULT     l   ALTER TABLE ONLY public.lieu ALTER COLUMN id_lieu SET DEFAULT nextval('public.lieu_id_lieu_seq'::regclass);
 ;   ALTER TABLE public.lieu ALTER COLUMN id_lieu DROP DEFAULT;
       public          mballand    false    223    224    224            7           2604    53454    objectif id_objectif    DEFAULT     |   ALTER TABLE ONLY public.objectif ALTER COLUMN id_objectif SET DEFAULT nextval('public.objectif_id_objectif_seq'::regclass);
 C   ALTER TABLE public.objectif ALTER COLUMN id_objectif DROP DEFAULT;
       public          mballand    false    239    238    239            5           2604    53455    objet id_objet    DEFAULT     p   ALTER TABLE ONLY public.objet ALTER COLUMN id_objet SET DEFAULT nextval('public.objet_id_objet_seq'::regclass);
 =   ALTER TABLE public.objet ALTER COLUMN id_objet DROP DEFAULT;
       public          mballand    false    232    231    232            4           2604    53456    personnage id_personnage    DEFAULT     �   ALTER TABLE ONLY public.personnage ALTER COLUMN id_personnage SET DEFAULT nextval('public.personnage_id_personnage_seq'::regclass);
 G   ALTER TABLE public.personnage ALTER COLUMN id_personnage DROP DEFAULT;
       public          mballand    false    228    227    228            3           2604    53457    race id_race    DEFAULT     l   ALTER TABLE ONLY public.race ALTER COLUMN id_race SET DEFAULT nextval('public.race_id_race_seq'::regclass);
 ;   ALTER TABLE public.race ALTER COLUMN id_race DROP DEFAULT;
       public          mballand    false    225    226    226            6           2604    53458    recompense id_recompense    DEFAULT     �   ALTER TABLE ONLY public.recompense ALTER COLUMN id_recompense SET DEFAULT nextval('public.recompense_id_recompense_seq'::regclass);
 G   ALTER TABLE public.recompense ALTER COLUMN id_recompense DROP DEFAULT;
       public          mballand    false    237    236    237            .           2604    53459    type_aptitude id_type_aptitude    DEFAULT     �   ALTER TABLE ONLY public.type_aptitude ALTER COLUMN id_type_aptitude SET DEFAULT nextval('public.type_aptitude_id_type_aptitude_seq'::regclass);
 M   ALTER TABLE public.type_aptitude ALTER COLUMN id_type_aptitude DROP DEFAULT;
       public          mballand    false    216    215    216            ,           2604    53460    type_objet id_type_objet    DEFAULT     �   ALTER TABLE ONLY public.type_objet ALTER COLUMN id_type_objet SET DEFAULT nextval('public.type_objet_id_type_objet_seq'::regclass);
 G   ALTER TABLE public.type_objet ALTER COLUMN id_type_objet DROP DEFAULT;
       public          mballand    false    212    211    212            v          0    53355    Log 
   TABLE DATA           5   COPY public."Log" (id, "Msg", "LogDate") FROM stdin;
    public          mballand    false    256   (<      x          0    53385    Option 
   TABLE DATA           >   COPY public."Option" ("Section", "Part", "Value") FROM stdin;
    public          mballand    false    258   �=      y          0    53439    Player 
   TABLE DATA           ^   COPY public."Player" (id_compte_utilisateur, "Name", "Email", "Password", valide) FROM stdin;
    public          mballand    false    259   =>      w          0    53376    Section 
   TABLE DATA           3   COPY public."Section" ("Code", "Name") FROM stdin;
    public          mballand    false    257   Z>      {          0    54530    a_testcarte 
   TABLE DATA           /   COPY public.a_testcarte (id_carte) FROM stdin;
    public          mballand    false    261   �>                0    54549    a_testobjet 
   TABLE DATA           <   COPY public.a_testobjet (id_objet, id_position) FROM stdin;
    public          mballand    false    265   �>      �          0    54563    a_testperso 
   TABLE DATA           <   COPY public.a_testperso (id_perso, id_position) FROM stdin;
    public          mballand    false    267   �>      }          0    54537 	   a_testpos 
   TABLE DATA           :   COPY public.a_testpos (id_position, id_carte) FROM stdin;
    public          mballand    false    263   �>      m          0    21432    accorde 
   TABLE DATA           D   COPY public.accorde (id_objet, id_recompense, quantite) FROM stdin;
    public          mballand    false    246   �>      s          0    22058    active 
   TABLE DATA           :   COPY public.active (id_objet, id_interaction) FROM stdin;
    public          mballand    false    252   ?      k          0    21377    affecte 
   TABLE DATA           D   COPY public.affecte (id_personnage, id_etat_personnage) FROM stdin;
    public          mballand    false    244   8?      ]          0    21068 
   appartient 
   TABLE DATA           >   COPY public.appartient (id_personnage, id_classe) FROM stdin;
    public          mballand    false    230   U?      Q          0    20243    aptitude 
   TABLE DATA           �   COPY public.aptitude (id_aptitude, nom_aptitude, effet_aptitude, prerequis_aptitude, id_type_aptitude, description) FROM stdin;
    public          mballand    false    218   r?      S          0    20325    caracteristique 
   TABLE DATA           k   COPY public.caracteristique (id_statistique, nom_caracteristique, description_caracteristique) FROM stdin;
    public          mballand    false    220   *C      M          0    20143    classe 
   TABLE DATA           T   COPY public.classe (id_classe, nom_classe, description_classe, jouable) FROM stdin;
    public          mballand    false    214   GC      n          0    21464 	   considere 
   TABLE DATA           W   COPY public.considere (id_personnage_juger, id_personnage_juge, aggressif) FROM stdin;
    public          mballand    false    247   dC      a          0    21222    contient 
   TABLE DATA           I   COPY public.contient (contenant, id_objet_contenu, quantite) FROM stdin;
    public          mballand    false    234   �C      q          0    21978 	   declenche 
   TABLE DATA           O   COPY public.declenche (id_interaction, id_recompense, id_objectif) FROM stdin;
    public          mballand    false    250   �C      \          0    21042    definit 
   TABLE DATA           T   COPY public.definit (id_personnage, id_statistique, valeur, valeur_max) FROM stdin;
    public          mballand    false    229   �C      j          0    21364    dialogue 
   TABLE DATA           a   COPY public.dialogue (id_dialogue, contenu_dialogue, id_personnage, caracteristique) FROM stdin;
    public          mballand    false    243   �C      r          0    22003    donne 
   TABLE DATA           <   COPY public.donne (id_interaction, id_dialogue) FROM stdin;
    public          mballand    false    251   �C      h          0    21333    etat_personnage 
   TABLE DATA           e   COPY public.etat_personnage (id_etat_personnage, nom_etat, effet_etat, description_etat) FROM stdin;
    public          mballand    false    241   D      p          0    21482    interaction 
   TABLE DATA           �   COPY public.interaction (id_interaction, prerequis_interaction, nom_interaction, description_interaction, completion_interaction, type_interaction) FROM stdin;
    public          mballand    false    249   /D      W          0    20827    lieu 
   TABLE DATA           O   COPY public.lieu (id_lieu, nom_lieu, description_lieu, carte_lieu) FROM stdin;
    public          mballand    false    224   oE      b          0    21292    maitrise 
   TABLE DATA           T   COPY public.maitrise (id_personnage, id_aptitude, pourcentage_maitrise) FROM stdin;
    public          mballand    false    235   �F      t          0    33642    mene 
   TABLE DATA           b   COPY public.mene (choix, caracteristique, id_dialogue_suivant, id_dialogue_precedent) FROM stdin;
    public          mballand    false    253   �F      f          0    21322    objectif 
   TABLE DATA           _   COPY public.objectif (id_objectif, nom_objectif, description_objectif, validation) FROM stdin;
    public          mballand    false    239   
G      _          0    21160    objet 
   TABLE DATA           �   COPY public.objet (id_objet, nom_objet, statistique_objet, equipe, ouvert, description_objet, prix, id_type_objet, poids) FROM stdin;
    public          mballand    false    232   'G      [          0    20998 
   personnage 
   TABLE DATA           �   COPY public.personnage (id_personnage, nom_personnage, niveau_personnage, direction, alignement, monnaie, vivant, id_race, id_compte_utilisateur, id_lieu) FROM stdin;
    public          mballand    false    228   �Q      U          0    20803    player 
   TABLE DATA           K   COPY public.player ("Id", "Name", "Email", "Password", valide) FROM stdin;
    public          mballand    false    222   �R      l          0    21392    possede 
   TABLE DATA           D   COPY public.possede (id_personnage, id_objet, quantite) FROM stdin;
    public          mballand    false    245   hS      Y          0    20896    race 
   TABLE DATA           L   COPY public.race (id_race, nom_race, description_race, jouable) FROM stdin;
    public          mballand    false    226   �S      d          0    21313 
   recompense 
   TABLE DATA           Z   COPY public.recompense (id_recompense, nom_recompense, decription_recompense) FROM stdin;
    public          mballand    false    237   XW      `          0    21185    relie 
   TABLE DATA           L   COPY public.relie (id_objet_porte_entre, id_objet_porte_sortie) FROM stdin;
    public          mballand    false    233   uW      O          0    20154    type_aptitude 
   TABLE DATA           L   COPY public.type_aptitude (id_type_aptitude, nom_type_aptitude) FROM stdin;
    public          mballand    false    216   �W      K          0    16933 
   type_objet 
   TABLE DATA           V   COPY public.type_objet (id_type_objet, nom_type_objet, emplacement_objet) FROM stdin;
    public          mballand    false    212   �W      �           0    0 
   Log_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Log_id_seq"', 12, true);
          public          mballand    false    255            �           0    0    a_testcarte_id_carte_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.a_testcarte_id_carte_seq', 1, false);
          public          mballand    false    260            �           0    0    a_testobjet_id_objet_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.a_testobjet_id_objet_seq', 1, false);
          public          mballand    false    264            �           0    0    a_testperso_id_perso_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.a_testperso_id_perso_seq', 1, false);
          public          mballand    false    266            �           0    0    a_testpos_id_position_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.a_testpos_id_position_seq', 1, false);
          public          mballand    false    262            �           0    0    aptitude_id_aptitude_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.aptitude_id_aptitude_seq', 1, false);
          public          mballand    false    217            �           0    0 !   caracteristique_id_statistque_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.caracteristique_id_statistque_seq', 1, false);
          public          mballand    false    219            �           0    0    classe_id_classe_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.classe_id_classe_seq', 1, false);
          public          mballand    false    213            �           0    0 ,   compte_utilisateur_id_compte_utilisateur_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.compte_utilisateur_id_compte_utilisateur_seq', 3, true);
          public          mballand    false    221            �           0    0    dialogue_id_dialogue_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.dialogue_id_dialogue_seq', 38, true);
          public          mballand    false    242            �           0    0 &   etat_personnage_id_etat_personnage_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.etat_personnage_id_etat_personnage_seq', 1, false);
          public          mballand    false    240            �           0    0    interaction_id_interaction_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.interaction_id_interaction_seq', 6, true);
          public          mballand    false    248            �           0    0    lieu_id_lieu_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.lieu_id_lieu_seq', 1, false);
          public          mballand    false    223            �           0    0    objectif_id_objectif_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.objectif_id_objectif_seq', 1, false);
          public          mballand    false    238            �           0    0    objet_id_objet_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.objet_id_objet_seq', 1, false);
          public          mballand    false    231            �           0    0    personnage_id_personnage_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.personnage_id_personnage_seq', 53, true);
          public          mballand    false    227            �           0    0    race_id_race_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.race_id_race_seq', 8, true);
          public          mballand    false    225            �           0    0    recompense_id_recompense_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.recompense_id_recompense_seq', 1, false);
          public          mballand    false    236            �           0    0 "   type_aptitude_id_type_aptitude_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.type_aptitude_id_type_aptitude_seq', 5, true);
          public          mballand    false    215            �           0    0    type_objet_id_type_objet_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.type_objet_id_type_objet_seq', 22, true);
          public          mballand    false    211            �           2606    53391    Option Option_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Option"
    ADD CONSTRAINT "Option_pkey" PRIMARY KEY ("Section", "Part");
 @   ALTER TABLE ONLY public."Option" DROP CONSTRAINT "Option_pkey";
       public            mballand    false    258    258            �           2606    53384    Section Section_Name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Section"
    ADD CONSTRAINT "Section_Name_key" UNIQUE ("Name");
 F   ALTER TABLE ONLY public."Section" DROP CONSTRAINT "Section_Name_key";
       public            mballand    false    257            �           2606    53382    Section Section_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Section"
    ADD CONSTRAINT "Section_pkey" PRIMARY KEY ("Code");
 B   ALTER TABLE ONLY public."Section" DROP CONSTRAINT "Section_pkey";
       public            mballand    false    257            �           2606    54535    a_testcarte a_testcarte_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.a_testcarte
    ADD CONSTRAINT a_testcarte_pkey PRIMARY KEY (id_carte);
 F   ALTER TABLE ONLY public.a_testcarte DROP CONSTRAINT a_testcarte_pkey;
       public            mballand    false    261            �           2606    54556 '   a_testobjet a_testobjet_id_position_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.a_testobjet
    ADD CONSTRAINT a_testobjet_id_position_key UNIQUE (id_position);
 Q   ALTER TABLE ONLY public.a_testobjet DROP CONSTRAINT a_testobjet_id_position_key;
       public            mballand    false    265            �           2606    54554    a_testobjet a_testobjet_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.a_testobjet
    ADD CONSTRAINT a_testobjet_pkey PRIMARY KEY (id_objet);
 F   ALTER TABLE ONLY public.a_testobjet DROP CONSTRAINT a_testobjet_pkey;
       public            mballand    false    265            �           2606    54570 '   a_testperso a_testperso_id_position_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.a_testperso
    ADD CONSTRAINT a_testperso_id_position_key UNIQUE (id_position);
 Q   ALTER TABLE ONLY public.a_testperso DROP CONSTRAINT a_testperso_id_position_key;
       public            mballand    false    267            �           2606    54568    a_testperso a_testperso_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.a_testperso
    ADD CONSTRAINT a_testperso_pkey PRIMARY KEY (id_perso);
 F   ALTER TABLE ONLY public.a_testperso DROP CONSTRAINT a_testperso_pkey;
       public            mballand    false    267            �           2606    54542    a_testpos a_testpos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.a_testpos
    ADD CONSTRAINT a_testpos_pkey PRIMARY KEY (id_position);
 B   ALTER TABLE ONLY public.a_testpos DROP CONSTRAINT a_testpos_pkey;
       public            mballand    false    263            ~           2606    21436    accorde accorde_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.accorde
    ADD CONSTRAINT accorde_pkey PRIMARY KEY (id_objet, id_recompense);
 >   ALTER TABLE ONLY public.accorde DROP CONSTRAINT accorde_pkey;
       public            mballand    false    246    246            z           2606    21381    affecte affecte_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.affecte
    ADD CONSTRAINT affecte_pkey PRIMARY KEY (id_personnage, id_etat_personnage);
 >   ALTER TABLE ONLY public.affecte DROP CONSTRAINT affecte_pkey;
       public            mballand    false    244    244            b           2606    21072    appartient appartient_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.appartient
    ADD CONSTRAINT appartient_pkey PRIMARY KEY (id_personnage, id_classe);
 D   ALTER TABLE ONLY public.appartient DROP CONSTRAINT appartient_pkey;
       public            mballand    false    230    230            N           2606    20250    aptitude aptitude_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.aptitude
    ADD CONSTRAINT aptitude_pkey PRIMARY KEY (id_aptitude);
 @   ALTER TABLE ONLY public.aptitude DROP CONSTRAINT aptitude_pkey;
       public            mballand    false    218            P           2606    20332 $   caracteristique caracteristique_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.caracteristique
    ADD CONSTRAINT caracteristique_pkey PRIMARY KEY (id_statistique);
 N   ALTER TABLE ONLY public.caracteristique DROP CONSTRAINT caracteristique_pkey;
       public            mballand    false    220            F           2606    20152    classe classe_nom_classe_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.classe
    ADD CONSTRAINT classe_nom_classe_key UNIQUE (nom_classe);
 F   ALTER TABLE ONLY public.classe DROP CONSTRAINT classe_nom_classe_key;
       public            mballand    false    214            H           2606    20150    classe classe_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.classe
    ADD CONSTRAINT classe_pkey PRIMARY KEY (id_classe);
 <   ALTER TABLE ONLY public.classe DROP CONSTRAINT classe_pkey;
       public            mballand    false    214            R           2606    20812 -   player compte_utilisateur_courriel_compte_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.player
    ADD CONSTRAINT compte_utilisateur_courriel_compte_key UNIQUE ("Email");
 W   ALTER TABLE ONLY public.player DROP CONSTRAINT compte_utilisateur_courriel_compte_key;
       public            mballand    false    222            T           2606    20814    player compte_utilisateur_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.player
    ADD CONSTRAINT compte_utilisateur_pkey PRIMARY KEY ("Id");
 H   ALTER TABLE ONLY public.player DROP CONSTRAINT compte_utilisateur_pkey;
       public            mballand    false    222            V           2606    20810 +   player compte_utilisateur_pseudo_compte_key 
   CONSTRAINT     h   ALTER TABLE ONLY public.player
    ADD CONSTRAINT compte_utilisateur_pseudo_compte_key UNIQUE ("Name");
 U   ALTER TABLE ONLY public.player DROP CONSTRAINT compte_utilisateur_pseudo_compte_key;
       public            mballand    false    222            �           2606    21468    considere considere_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.considere
    ADD CONSTRAINT considere_pkey PRIMARY KEY (id_personnage_juger, id_personnage_juge);
 B   ALTER TABLE ONLY public.considere DROP CONSTRAINT considere_pkey;
       public            mballand    false    247    247            j           2606    21226    contient contient_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.contient
    ADD CONSTRAINT contient_pkey PRIMARY KEY (contenant, id_objet_contenu);
 @   ALTER TABLE ONLY public.contient DROP CONSTRAINT contient_pkey;
       public            mballand    false    234    234            �           2606    21982    declenche declenche_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.declenche
    ADD CONSTRAINT declenche_pkey PRIMARY KEY (id_interaction, id_recompense, id_objectif);
 B   ALTER TABLE ONLY public.declenche DROP CONSTRAINT declenche_pkey;
       public            mballand    false    250    250    250            `           2606    21046    definit definit_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.definit
    ADD CONSTRAINT definit_pkey PRIMARY KEY (id_personnage, id_statistique);
 >   ALTER TABLE ONLY public.definit DROP CONSTRAINT definit_pkey;
       public            mballand    false    229    229            x           2606    21371    dialogue dialogue_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.dialogue
    ADD CONSTRAINT dialogue_pkey PRIMARY KEY (id_dialogue);
 @   ALTER TABLE ONLY public.dialogue DROP CONSTRAINT dialogue_pkey;
       public            mballand    false    243            t           2606    21342 ,   etat_personnage etat_personnage_nom_etat_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.etat_personnage
    ADD CONSTRAINT etat_personnage_nom_etat_key UNIQUE (nom_etat);
 V   ALTER TABLE ONLY public.etat_personnage DROP CONSTRAINT etat_personnage_nom_etat_key;
       public            mballand    false    241            v           2606    21340 $   etat_personnage etat_personnage_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.etat_personnage
    ADD CONSTRAINT etat_personnage_pkey PRIMARY KEY (id_etat_personnage);
 N   ALTER TABLE ONLY public.etat_personnage DROP CONSTRAINT etat_personnage_pkey;
       public            mballand    false    241            �           2606    21489    interaction interaction_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.interaction
    ADD CONSTRAINT interaction_pkey PRIMARY KEY (id_interaction);
 F   ALTER TABLE ONLY public.interaction DROP CONSTRAINT interaction_pkey;
       public            mballand    false    249            X           2606    20834    lieu lieu_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.lieu
    ADD CONSTRAINT lieu_pkey PRIMARY KEY (id_lieu);
 8   ALTER TABLE ONLY public.lieu DROP CONSTRAINT lieu_pkey;
       public            mballand    false    224            l           2606    21296    maitrise maitrise_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.maitrise
    ADD CONSTRAINT maitrise_pkey PRIMARY KEY (id_personnage, id_aptitude);
 @   ALTER TABLE ONLY public.maitrise DROP CONSTRAINT maitrise_pkey;
       public            mballand    false    235    235            �           2606    33648    mene mene_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.mene
    ADD CONSTRAINT mene_pkey PRIMARY KEY (id_dialogue_suivant, id_dialogue_precedent);
 8   ALTER TABLE ONLY public.mene DROP CONSTRAINT mene_pkey;
       public            mballand    false    253    253            p           2606    21331 "   objectif objectif_nom_objectif_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.objectif
    ADD CONSTRAINT objectif_nom_objectif_key UNIQUE (nom_objectif);
 L   ALTER TABLE ONLY public.objectif DROP CONSTRAINT objectif_nom_objectif_key;
       public            mballand    false    239            r           2606    21329    objectif objectif_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.objectif
    ADD CONSTRAINT objectif_pkey PRIMARY KEY (id_objectif);
 @   ALTER TABLE ONLY public.objectif DROP CONSTRAINT objectif_pkey;
       public            mballand    false    239            d           2606    21169    objet objet_nom_objet_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.objet
    ADD CONSTRAINT objet_nom_objet_key UNIQUE (nom_objet);
 C   ALTER TABLE ONLY public.objet DROP CONSTRAINT objet_nom_objet_key;
       public            mballand    false    232            f           2606    21167    objet objet_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.objet
    ADD CONSTRAINT objet_pkey PRIMARY KEY (id_objet);
 :   ALTER TABLE ONLY public.objet DROP CONSTRAINT objet_pkey;
       public            mballand    false    232            ^           2606    21005    personnage personnage_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.personnage
    ADD CONSTRAINT personnage_pkey PRIMARY KEY (id_personnage);
 D   ALTER TABLE ONLY public.personnage DROP CONSTRAINT personnage_pkey;
       public            mballand    false    228            |           2606    21396    possede possede_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.possede
    ADD CONSTRAINT possede_pkey PRIMARY KEY (id_personnage, id_objet);
 >   ALTER TABLE ONLY public.possede DROP CONSTRAINT possede_pkey;
       public            mballand    false    245    245            Z           2606    20905    race race_nom_race_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_nom_race_key UNIQUE (nom_race);
 @   ALTER TABLE ONLY public.race DROP CONSTRAINT race_nom_race_key;
       public            mballand    false    226            \           2606    20903    race race_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_pkey PRIMARY KEY (id_race);
 8   ALTER TABLE ONLY public.race DROP CONSTRAINT race_pkey;
       public            mballand    false    226            n           2606    21320    recompense recompense_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.recompense
    ADD CONSTRAINT recompense_pkey PRIMARY KEY (id_recompense);
 D   ALTER TABLE ONLY public.recompense DROP CONSTRAINT recompense_pkey;
       public            mballand    false    237            h           2606    21189    relie relie_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.relie
    ADD CONSTRAINT relie_pkey PRIMARY KEY (id_objet_porte_entre, id_objet_porte_sortie);
 :   ALTER TABLE ONLY public.relie DROP CONSTRAINT relie_pkey;
       public            mballand    false    233    233            J           2606    20161 1   type_aptitude type_aptitude_nom_type_aptitude_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.type_aptitude
    ADD CONSTRAINT type_aptitude_nom_type_aptitude_key UNIQUE (nom_type_aptitude);
 [   ALTER TABLE ONLY public.type_aptitude DROP CONSTRAINT type_aptitude_nom_type_aptitude_key;
       public            mballand    false    216            L           2606    20159     type_aptitude type_aptitude_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.type_aptitude
    ADD CONSTRAINT type_aptitude_pkey PRIMARY KEY (id_type_aptitude);
 J   ALTER TABLE ONLY public.type_aptitude DROP CONSTRAINT type_aptitude_pkey;
       public            mballand    false    216            B           2606    16942 (   type_objet type_objet_nom_type_objet_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.type_objet
    ADD CONSTRAINT type_objet_nom_type_objet_key UNIQUE (nom_type_objet);
 R   ALTER TABLE ONLY public.type_objet DROP CONSTRAINT type_objet_nom_type_objet_key;
       public            mballand    false    212            D           2606    16940    type_objet type_objet_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.type_objet
    ADD CONSTRAINT type_objet_pkey PRIMARY KEY (id_type_objet);
 D   ALTER TABLE ONLY public.type_objet DROP CONSTRAINT type_objet_pkey;
       public            mballand    false    212            �           2606    53392    Option Option_Section_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Option"
    ADD CONSTRAINT "Option_Section_fkey" FOREIGN KEY ("Section") REFERENCES public."Section"("Code");
 H   ALTER TABLE ONLY public."Option" DROP CONSTRAINT "Option_Section_fkey";
       public          mballand    false    258    257    3722            �           2606    54557 (   a_testobjet a_testobjet_id_position_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_testobjet
    ADD CONSTRAINT a_testobjet_id_position_fkey FOREIGN KEY (id_position) REFERENCES public.a_testpos(id_position);
 R   ALTER TABLE ONLY public.a_testobjet DROP CONSTRAINT a_testobjet_id_position_fkey;
       public          mballand    false    265    263    3728            �           2606    54571 (   a_testperso a_testperso_id_position_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_testperso
    ADD CONSTRAINT a_testperso_id_position_fkey FOREIGN KEY (id_position) REFERENCES public.a_testpos(id_position);
 R   ALTER TABLE ONLY public.a_testperso DROP CONSTRAINT a_testperso_id_position_fkey;
       public          mballand    false    263    3728    267            �           2606    54543 !   a_testpos a_testpos_id_carte_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_testpos
    ADD CONSTRAINT a_testpos_id_carte_fkey FOREIGN KEY (id_carte) REFERENCES public.a_testcarte(id_carte);
 K   ALTER TABLE ONLY public.a_testpos DROP CONSTRAINT a_testpos_id_carte_fkey;
       public          mballand    false    3726    263    261            �           2606    21437    accorde accorde_id_objet_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accorde
    ADD CONSTRAINT accorde_id_objet_fkey FOREIGN KEY (id_objet) REFERENCES public.objet(id_objet);
 G   ALTER TABLE ONLY public.accorde DROP CONSTRAINT accorde_id_objet_fkey;
       public          mballand    false    232    246    3686            �           2606    21442 "   accorde accorde_id_recompense_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accorde
    ADD CONSTRAINT accorde_id_recompense_fkey FOREIGN KEY (id_recompense) REFERENCES public.recompense(id_recompense);
 L   ALTER TABLE ONLY public.accorde DROP CONSTRAINT accorde_id_recompense_fkey;
       public          mballand    false    3694    237    246            �           2606    22068 !   active active_id_interaction_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.active
    ADD CONSTRAINT active_id_interaction_fkey FOREIGN KEY (id_interaction) REFERENCES public.interaction(id_interaction);
 K   ALTER TABLE ONLY public.active DROP CONSTRAINT active_id_interaction_fkey;
       public          mballand    false    249    3714    252            �           2606    22063    active active_id_objet_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.active
    ADD CONSTRAINT active_id_objet_fkey FOREIGN KEY (id_objet) REFERENCES public.objet(id_objet);
 E   ALTER TABLE ONLY public.active DROP CONSTRAINT active_id_objet_fkey;
       public          mballand    false    252    232    3686            �           2606    21387 '   affecte affecte_id_etat_personnage_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.affecte
    ADD CONSTRAINT affecte_id_etat_personnage_fkey FOREIGN KEY (id_etat_personnage) REFERENCES public.etat_personnage(id_etat_personnage);
 Q   ALTER TABLE ONLY public.affecte DROP CONSTRAINT affecte_id_etat_personnage_fkey;
       public          mballand    false    3702    241    244            �           2606    21382 "   affecte affecte_id_personnage_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.affecte
    ADD CONSTRAINT affecte_id_personnage_fkey FOREIGN KEY (id_personnage) REFERENCES public.personnage(id_personnage);
 L   ALTER TABLE ONLY public.affecte DROP CONSTRAINT affecte_id_personnage_fkey;
       public          mballand    false    228    244    3678            �           2606    21078 $   appartient appartient_id_classe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appartient
    ADD CONSTRAINT appartient_id_classe_fkey FOREIGN KEY (id_classe) REFERENCES public.classe(id_classe);
 N   ALTER TABLE ONLY public.appartient DROP CONSTRAINT appartient_id_classe_fkey;
       public          mballand    false    214    3656    230            �           2606    21073 (   appartient appartient_id_personnage_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appartient
    ADD CONSTRAINT appartient_id_personnage_fkey FOREIGN KEY (id_personnage) REFERENCES public.personnage(id_personnage);
 R   ALTER TABLE ONLY public.appartient DROP CONSTRAINT appartient_id_personnage_fkey;
       public          mballand    false    230    3678    228            �           2606    21253 '   aptitude aptitude_id_type_aptitude_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aptitude
    ADD CONSTRAINT aptitude_id_type_aptitude_fkey FOREIGN KEY (id_type_aptitude) REFERENCES public.type_aptitude(id_type_aptitude);
 Q   ALTER TABLE ONLY public.aptitude DROP CONSTRAINT aptitude_id_type_aptitude_fkey;
       public          mballand    false    3660    218    216            �           2606    21474 +   considere considere_id_personnage_juge_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.considere
    ADD CONSTRAINT considere_id_personnage_juge_fkey FOREIGN KEY (id_personnage_juge) REFERENCES public.personnage(id_personnage);
 U   ALTER TABLE ONLY public.considere DROP CONSTRAINT considere_id_personnage_juge_fkey;
       public          mballand    false    247    228    3678            �           2606    21469 ,   considere considere_id_personnage_juger_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.considere
    ADD CONSTRAINT considere_id_personnage_juger_fkey FOREIGN KEY (id_personnage_juger) REFERENCES public.personnage(id_personnage);
 V   ALTER TABLE ONLY public.considere DROP CONSTRAINT considere_id_personnage_juger_fkey;
       public          mballand    false    228    247    3678            �           2606    21227     contient contient_contenant_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contient
    ADD CONSTRAINT contient_contenant_fkey FOREIGN KEY (contenant) REFERENCES public.objet(id_objet);
 J   ALTER TABLE ONLY public.contient DROP CONSTRAINT contient_contenant_fkey;
       public          mballand    false    232    234    3686            �           2606    21232 '   contient contient_id_objet_contenu_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contient
    ADD CONSTRAINT contient_id_objet_contenu_fkey FOREIGN KEY (id_objet_contenu) REFERENCES public.objet(id_objet);
 Q   ALTER TABLE ONLY public.contient DROP CONSTRAINT contient_id_objet_contenu_fkey;
       public          mballand    false    232    3686    234            �           2606    21983 '   declenche declenche_id_interaction_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.declenche
    ADD CONSTRAINT declenche_id_interaction_fkey FOREIGN KEY (id_interaction) REFERENCES public.interaction(id_interaction);
 Q   ALTER TABLE ONLY public.declenche DROP CONSTRAINT declenche_id_interaction_fkey;
       public          mballand    false    249    250    3714            �           2606    21993 $   declenche declenche_id_objectif_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.declenche
    ADD CONSTRAINT declenche_id_objectif_fkey FOREIGN KEY (id_objectif) REFERENCES public.objectif(id_objectif);
 N   ALTER TABLE ONLY public.declenche DROP CONSTRAINT declenche_id_objectif_fkey;
       public          mballand    false    239    250    3698            �           2606    21988 &   declenche declenche_id_recompense_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.declenche
    ADD CONSTRAINT declenche_id_recompense_fkey FOREIGN KEY (id_recompense) REFERENCES public.recompense(id_recompense);
 P   ALTER TABLE ONLY public.declenche DROP CONSTRAINT declenche_id_recompense_fkey;
       public          mballand    false    237    3694    250            �           2606    21047 "   definit definit_id_personnage_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.definit
    ADD CONSTRAINT definit_id_personnage_fkey FOREIGN KEY (id_personnage) REFERENCES public.personnage(id_personnage);
 L   ALTER TABLE ONLY public.definit DROP CONSTRAINT definit_id_personnage_fkey;
       public          mballand    false    228    3678    229            �           2606    21052 #   definit definit_id_statistique_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.definit
    ADD CONSTRAINT definit_id_statistique_fkey FOREIGN KEY (id_statistique) REFERENCES public.caracteristique(id_statistique);
 M   ALTER TABLE ONLY public.definit DROP CONSTRAINT definit_id_statistique_fkey;
       public          mballand    false    3664    229    220            �           2606    21372 $   dialogue dialogue_id_personnage_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dialogue
    ADD CONSTRAINT dialogue_id_personnage_fkey FOREIGN KEY (id_personnage) REFERENCES public.personnage(id_personnage);
 N   ALTER TABLE ONLY public.dialogue DROP CONSTRAINT dialogue_id_personnage_fkey;
       public          mballand    false    243    228    3678            �           2606    22013    donne donne_id_dialogue_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.donne
    ADD CONSTRAINT donne_id_dialogue_fkey FOREIGN KEY (id_dialogue) REFERENCES public.dialogue(id_dialogue);
 F   ALTER TABLE ONLY public.donne DROP CONSTRAINT donne_id_dialogue_fkey;
       public          mballand    false    251    243    3704            �           2606    22008    donne donne_id_interaction_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.donne
    ADD CONSTRAINT donne_id_interaction_fkey FOREIGN KEY (id_interaction) REFERENCES public.interaction(id_interaction);
 I   ALTER TABLE ONLY public.donne DROP CONSTRAINT donne_id_interaction_fkey;
       public          mballand    false    249    251    3714            �           2606    21302 "   maitrise maitrise_id_aptitude_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maitrise
    ADD CONSTRAINT maitrise_id_aptitude_fkey FOREIGN KEY (id_aptitude) REFERENCES public.aptitude(id_aptitude);
 L   ALTER TABLE ONLY public.maitrise DROP CONSTRAINT maitrise_id_aptitude_fkey;
       public          mballand    false    235    218    3662            �           2606    21297 $   maitrise maitrise_id_personnage_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maitrise
    ADD CONSTRAINT maitrise_id_personnage_fkey FOREIGN KEY (id_personnage) REFERENCES public.personnage(id_personnage);
 N   ALTER TABLE ONLY public.maitrise DROP CONSTRAINT maitrise_id_personnage_fkey;
       public          mballand    false    235    228    3678            �           2606    33654 $   mene mene_id_dialogue_precedent_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mene
    ADD CONSTRAINT mene_id_dialogue_precedent_fkey FOREIGN KEY (id_dialogue_precedent) REFERENCES public.dialogue(id_dialogue);
 N   ALTER TABLE ONLY public.mene DROP CONSTRAINT mene_id_dialogue_precedent_fkey;
       public          mballand    false    3704    243    253            �           2606    33649 "   mene mene_id_dialogue_suivant_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mene
    ADD CONSTRAINT mene_id_dialogue_suivant_fkey FOREIGN KEY (id_dialogue_suivant) REFERENCES public.dialogue(id_dialogue);
 L   ALTER TABLE ONLY public.mene DROP CONSTRAINT mene_id_dialogue_suivant_fkey;
       public          mballand    false    3704    243    253            �           2606    21200    objet objet_id_type_objet_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.objet
    ADD CONSTRAINT objet_id_type_objet_fkey FOREIGN KEY (id_type_objet) REFERENCES public.type_objet(id_type_objet);
 H   ALTER TABLE ONLY public.objet DROP CONSTRAINT objet_id_type_objet_fkey;
       public          mballand    false    212    3652    232            �           2606    21011 0   personnage personnage_id_compte_utilisateur_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personnage
    ADD CONSTRAINT personnage_id_compte_utilisateur_fkey FOREIGN KEY (id_compte_utilisateur) REFERENCES public.player("Id");
 Z   ALTER TABLE ONLY public.personnage DROP CONSTRAINT personnage_id_compte_utilisateur_fkey;
       public          mballand    false    228    3668    222            �           2606    21016 "   personnage personnage_id_lieu_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personnage
    ADD CONSTRAINT personnage_id_lieu_fkey FOREIGN KEY (id_lieu) REFERENCES public.lieu(id_lieu);
 L   ALTER TABLE ONLY public.personnage DROP CONSTRAINT personnage_id_lieu_fkey;
       public          mballand    false    3672    224    228            �           2606    21006 "   personnage personnage_id_race_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personnage
    ADD CONSTRAINT personnage_id_race_fkey FOREIGN KEY (id_race) REFERENCES public.race(id_race);
 L   ALTER TABLE ONLY public.personnage DROP CONSTRAINT personnage_id_race_fkey;
       public          mballand    false    3676    228    226            �           2606    21402    possede possede_id_objet_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.possede
    ADD CONSTRAINT possede_id_objet_fkey FOREIGN KEY (id_objet) REFERENCES public.objet(id_objet);
 G   ALTER TABLE ONLY public.possede DROP CONSTRAINT possede_id_objet_fkey;
       public          mballand    false    245    232    3686            �           2606    21397 "   possede possede_id_personnage_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.possede
    ADD CONSTRAINT possede_id_personnage_fkey FOREIGN KEY (id_personnage) REFERENCES public.personnage(id_personnage);
 L   ALTER TABLE ONLY public.possede DROP CONSTRAINT possede_id_personnage_fkey;
       public          mballand    false    228    3678    245            �           2606    21190 %   relie relie_id_objet_porte_entre_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.relie
    ADD CONSTRAINT relie_id_objet_porte_entre_fkey FOREIGN KEY (id_objet_porte_entre) REFERENCES public.objet(id_objet);
 O   ALTER TABLE ONLY public.relie DROP CONSTRAINT relie_id_objet_porte_entre_fkey;
       public          mballand    false    232    233    3686            �           2606    21195 &   relie relie_id_objet_porte_sortie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.relie
    ADD CONSTRAINT relie_id_objet_porte_sortie_fkey FOREIGN KEY (id_objet_porte_sortie) REFERENCES public.objet(id_objet);
 P   ALTER TABLE ONLY public.relie DROP CONSTRAINT relie_id_objet_porte_sortie_fkey;
       public          mballand    false    233    3686    232            v   �  x���ۊ�0�������hF�7�U�^���`굲>l�o�I�l�6�(�e雙�1��4�9��:�I6O絑}ɋ��*��aYwF�k�C��'�y��X��0�k�]�G&|n�-�I��4x�������!$��F���9��C綁���&����Zm䴍�|>�/��uh��[��X~�0�/yn��Px�j!teZֹ�?�RBR��$ܻAyc���� ��F��;"�g���H!
���_�&�,�	F ^ʵ��N��q��k~y����m���g5����i��m�a�C�|<-y����c��"Ǆ��B$$���l"J������5�"(#^\^��<,
��.6�c�>Z��^�@���C�n��^+4�XS_ǰ:(ں B%�$
ʒ'�"�0(YLX����k .���g-�u<k �]P΃?�x�U¿&M�E+�(!����t      x   0   x�s��t�q�����LJ�ry��9�x��s�s��qqq  
�      y      x������ � �      w       x�s��t.�,(�O/J,Ȩ����� d�Z      {      x������ � �            x������ � �      �      x������ � �      }      x������ � �      m      x������ � �      s      x������ � �      k      x������ � �      ]      x������ � �      Q   �  x��U�r�6<_���*'e���{��M*Uy�RNN��䈞*��P��&�0��	�Xf@��%m��$�1���b�Ӷ/�(ķC�]�2�:��Y�P;���J2�R<��-x5��j�0B>��;�O���L^mt��������W��yO�q�˃��6�y~�l��	T���\��W��Td��n�q@��5&���w��$�P�Yt:����~�
��D�F5U}�c�w�{�ю��r�C��5��=W�c9m=W��ac�z�����T*��o'�Zh12	ڍ�f��D�nuL�\��&ߋ{�_ؤ�i�g��I(Ic�[��]��Hr�#*�Ҿ=8	LEw���h딉�se3��ť�I��L6Q
�Ϸ���4Lg�m k�yd������Fd5���`�r$S�G�$b�;]a<�����Ei�z5�&m1D��g;C��u^�	�u=�C�LdN���˼���䑿��d��q�#a�痐�Q#��,�����v���������������A��4������)�k�����+�A�t���_Lٝ���Գs>O3��,nĺAï�ꨨ�G��c��<��.f,�9�}nL{���˂V����'T;�6n�C���&��>�1":�@�턡�dq'~�D����8O��jjv&��K������{�,/Ń�:#G�U�?bK[.T7�V���{ŗeA�n�=�Q�2F��U�)��Ƭm0�=�x�����Xi�˒���"ey�P mN�u��I���mP��?X^�����S����M4�<���  GY�m/�����.=�k9�l���C�;!g��k،k�@�0��y!V�g��C_�z[��ow����U��'��;�z��!`�P�x���5�g�,o�#xϋ魧�/�;�&��om�����t��򏯥�� dX'�      S      x������ � �      M      x������ � �      n      x������ � �      a      x������ � �      q      x������ � �      \      x������ � �      j      x������ � �      r      x������ � �      h      x������ � �      p   0  x�}��J1�ϙ��MW�wG/
��Kf&;[�C�.�k��s����xRh�~�~I� � ��h�kśeC��#v�"�ƍmpAN�l<a��w��]�ı:�m��=~�9�kZE�X5��&�Kj\"I���yϸ{��/xޛ�� ��x<���ԬB��=V{˺%��SZ��b.m�l���R���+BN��r
���d���[��{�ծ��\vȀ�%kY���g���&9��%�Z�Sv�R�ٜ&�3(j�&��#�Ɔ)ۇx�t��"��B��$�>r��4��q�NfOUU}����      W   Q  x�]R�n� <��§���'i���SU�rY㵍���u��}�h]���>f��ݎ�j��O!�'�	�����"��-Aa`C	7�x!��j��׼S���0�?�U��������)6���׍����γ�Ӥ�`v����'���5��AB<�ţ�;�����E�C2�T�頖����4���`㮉��˴e%��ZG5�k2]���"Fl՘`M�9ٽ�޸�|no�;u�p�=�F#?f�y�%�9B��~���G�\~��¡��Y�1'B@�ИrtK��q�}o�-�X���
Z���ʇ��K��(@��K8ޓ���GB�\B���(~ ]R�!      b      x������ � �      t      x������ � �      f      x������ � �      _   �
  x�}XMs�=����TY���p�tri�v�)�Z�o�J�$f�I� 8����Hn^��s�����)͇��v�$��ݯ_c*Z�:�0R���b*���Z�w�ekj�Y�W�yzd�e��G��,���z11MRQ�&�ҫ.7��Zz`�=^�Fn�2����8����_��q>��4��*�`���$8U�`l��J�mZ�Tˏ��]0���ᩓ,��h����k4۟%s�\�*e���lpgotG+C��R���<u
 �,���y���2���V��<^X��?W������N��?���:6�H�������w6�P����
��)���)����@���E��(w��;횝l-�� ���"�@U��l�i6�&������T�bu`�N�V[�L`��U���f�dJ'Y+K�y���j ��M��c�zRN��m̓I*Zk���K�ɡ+ D5�.�@_p���K��qJ	���mg�J �G�x����O����\�Z��\Y�B�b��ӌ��wF0��NSzx�1t)�%>+�vd�B������i;g�� �lR�z�dr%2�� k�_m��a�<ԃ��,TQ���,Tk�~&&�t,r�q:�!��l������j���/��3¤�X�9r>��F):�[ך��&ӉxxSQ-�G�q��M�밸v���-�t)'��dޙ��6�d:�mUF�82y�(�@J5�5��S� ��d�d:m��(��9��\G���l��(l��[�瘓o����+ :��r�I�Y󔗔�]MG�>rl
.-D���2�t}����ʄX����@�G�d;�kKQ���xs��5��	�n���/(�����d�mWU�n�����3��9y��ćSl`�L��F5p����GN�P��=�Z.��5l"?iD��w�/�'�cb�h"5bA�de��cQ���Ź5����aI��E�ґB�Xo�/��{�pJ�3KҔ���T�����n�ύ	],�{��F�`��<Ig�D�g�~G����g��c�$0�`n�'��;*�� w��a�$"ӠI�՜��]�61���G��ΘɈ%��_�bVw�:���`M��2#�E�w%��_��Ρ:L���@-d�da'h-[Z$��1?����C�HE�_SP�"��+YVVH�٘�Dl��7Se���A]�����K�Ϧ��l"16����Vɓ������z�F'˵���F�T�
�ߟ���<�Pj��0�����Bk��d���[2�ʦ;Oľ���}K��#O	�0Of�ϡ�h�
����O1�t�n�>eF��z$�����s����0�ݩ�`>F�m�|+��g�e������ޣ_������N	jes��Bܗ:Sl���f�b�~�E�����T'u�p���pi>l��D��r����/W�	��n�mW�6�ߖW~�9�P�%5O��5q"�E�K� nD�ռ��Y���h�ԅH�b[������8�H�����+��t�򧎉2�s����'��]M���A2������E�GQ�S�D�̋�"x�������V�C���[�+qV�r�1k$�̷S������"��)���ͣ~9�L(�j�L�z�oF�b���gEzE���P�;Wj�m��ccs���
5���1��c�H�};��/��f��U2p�s	��$�����n�̗��R5���@K{^$����[�F1s5�G��0}s�>G,Z6kg|�ĖT���2���phH<�� 5	z�@�.�V�g��.�/����Pu�=����Qِ�t�@��(4��f^�6vPK�!iz�#z
P�Z�l�邸�P�D�F:+5��r����e����g%I8<A���U\`C���"[QP�Һ}.�n�h��G7�B��s�,D�(���>�y�����5�ȣ���!6�6TƦ�@ea��I�Q^�}y "ے�,B�nfMM��ʩĕ ���`��]�SU;�3>��֑h���7���n+����&�-/w��CĐ�y���!|t�/Lp��X�(��q����^f0xK�i�j��?�+�?Ԑ�9a�3��ܵ���`lKlc%(���u'���#L�Ԍ_K:
 �%>�uk�x�-ܪ��a�oZ�9����y��XX�v�����S?�叞Ђ�^NK��@o��]�tW��v-�/'�k�����԰���h��(N�?���;���I��)�|�#�|��'b�,gb݅�gD��������lJ� �H�?\���t��J�+Mc����X@����9�Ru��2���n*���ǩ@�ӧp�����آ��p��eg��6�,N����J�����@�4��(|��󫓋��Kڹj�X�x��x�&���1���?�oK�0B��2 �J\,;�K�(4�(�g�K��1V4����!FP h�m���yG<�!�OlJUEA�Nnl��dEw+(i,��IW���ט��X�B��8񢥥q�Q$�Va}E�	H������ �9��)���J#W��RIC5��f�u���I2��BA�ʿ"��ǹ#i@w=�@|���*B)ɭ$�[/ �%2���-��q�bd��%�����G@Hё��\ӱ'��7����d�nќ�p���I�6<틞����y��M�#���'�c�$�>� o      [   �   x�m��n�0��y�N�-c;R8 �ĉ�G�6K��L���N�0Y��+�ٿ��'�����;�)�ʡ"vȭ>�0XQ{�>Q�A%��(��ѧ�_�Z�G�{��3l�8��(>�,`��M,>�����?��LS���ʧ(�+�h#�~C�EcfРC]�t%�J�w��v�]��S1E�L'{��-f���JV,�h�����ɨ���n�
�3e�#t�Fݸ���IҨ�R�I�e      U   �   x�5��
�0 �����m���Բ��$�˒�#Ť���WB�����@u���̥�\C�v��1��[8.���`p�%��h|�S�s�,4������H�.A˕��x%�j�C/���=$X�Q��Y��T�� g��<j���GB�4j�-7�#�����{�!� 4"      l      x������ � �      Y   �  x�mU���D�w�b2��Jp@�'�8	R�����i<��y2D�� ��oP��ݏC+�=�=�U]�/N?P��x���͍��.ǚ$��i<z���$!���;)����Jc��n���������]��=R��c�B��gD�"���i�N��J���{N�C��݂
�Ja	CbDe�����<׀�=�U�HR���Ͽ ���Ur����W�ϔ]ط������xT张��Uإ}��J.Ѳ�T�2Ւ�#Q���3`�[�4!W��HΎ��f�<KG��if�b����%�����.
��Ō3�	hZb��g��O�����TΟ��%e��#�Iau��둚��@��& �]���Q5�}�P����4>P���oMiؔb������~�C�A&�L�Sρ$)Ρ�qk8�7��W���.k�
�'*'�ʠd�ǤMQ�<ZU,o�N�u�(٣��h���,i�KǮ!�2�Zɍ���zm:R��	N�
[�:��#���3�����;��y���{�a��7|���E�6n�vE��M�6�h�͢T4ukP*r%�G��W�xB��_*7�I�P%���t�r��9R��;��+�y�-���<ʇzL"�{q�����9q�������!�ͳ�I�y9Dm�:�fDM��\��ܣR�+'����?�`���-�eV�M��|;��C�W���]���4�XU�|������.���[����^��m��@{Z�<4Cb���8�E�i�����ܷuN���MeYk[�0Zm$ 	��m&�rE��5)[Wʹ�S�2�\0�:R�a��u����>Q�-M�,y)��i�y��ZA�(���n�W�1Y*��7�=��`(7��U7S#�M8�N��-�^(&���-�U���avκl�^䚎�C�_��Ċ[t��������C�C�	�<.�؉�ן������_      d      x������ � �      `      x������ � �      O   P   x�3�t9�� '19575��ˈ�1)3'����b.cN�Ģ�d �(���4�˄�7�� /U!%�X!7?���(��+F��� ��      K   �   x�e��!��P�T`������@#�2ЏW���I��s�///O%o�8����(T��
=��W5i�\�5h�{��sߴ|I��3����;��-���
s��o?���}�\��!�{���j3�uY�=��LOS{�����@�     