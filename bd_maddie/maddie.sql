PGDMP                          y            maddie    13.1    13.1 �   t           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            u           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            v           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            w           1262    17294    maddie    DATABASE     b   CREATE DATABASE maddie WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE maddie;
                maddie    false            �            1259    17446    admin_interface_theme    TABLE     �  CREATE TABLE public.admin_interface_theme (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    active boolean NOT NULL,
    title character varying(50) NOT NULL,
    title_visible boolean NOT NULL,
    logo character varying(100) NOT NULL,
    logo_visible boolean NOT NULL,
    css_header_background_color character varying(10) NOT NULL,
    title_color character varying(10) NOT NULL,
    css_header_text_color character varying(10) NOT NULL,
    css_header_link_color character varying(10) NOT NULL,
    css_header_link_hover_color character varying(10) NOT NULL,
    css_module_background_color character varying(10) NOT NULL,
    css_module_text_color character varying(10) NOT NULL,
    css_module_link_color character varying(10) NOT NULL,
    css_module_link_hover_color character varying(10) NOT NULL,
    css_module_rounded_corners boolean NOT NULL,
    css_generic_link_color character varying(10) NOT NULL,
    css_generic_link_hover_color character varying(10) NOT NULL,
    css_save_button_background_color character varying(10) NOT NULL,
    css_save_button_background_hover_color character varying(10) NOT NULL,
    css_save_button_text_color character varying(10) NOT NULL,
    css_delete_button_background_color character varying(10) NOT NULL,
    css_delete_button_background_hover_color character varying(10) NOT NULL,
    css_delete_button_text_color character varying(10) NOT NULL,
    css text NOT NULL,
    list_filter_dropdown boolean NOT NULL,
    related_modal_active boolean NOT NULL,
    related_modal_background_color character varying(10) NOT NULL,
    related_modal_rounded_corners boolean NOT NULL,
    logo_color character varying(10) NOT NULL,
    recent_actions_visible boolean NOT NULL,
    favicon character varying(100) NOT NULL,
    related_modal_background_opacity character varying(5) NOT NULL,
    env_name character varying(50) NOT NULL,
    env_visible_in_header boolean NOT NULL,
    env_color character varying(10) NOT NULL,
    env_visible_in_favicon boolean NOT NULL,
    related_modal_close_button_visible boolean NOT NULL,
    language_chooser_active boolean NOT NULL,
    language_chooser_display character varying(10) NOT NULL,
    list_filter_sticky boolean NOT NULL
);
 )   DROP TABLE public.admin_interface_theme;
       public         heap    maddie    false            �            1259    17444    admin_interface_theme_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_interface_theme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.admin_interface_theme_id_seq;
       public          maddie    false    219            x           0    0    admin_interface_theme_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.admin_interface_theme_id_seq OWNED BY public.admin_interface_theme.id;
          public          maddie    false    218            �            1259    17326 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    maddie    false            �            1259    17324    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          maddie    false    207            y           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          maddie    false    206            �            1259    17336    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    maddie    false            �            1259    17334    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          maddie    false    209            z           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          maddie    false    208            �            1259    17318    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    maddie    false            �            1259    17316    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          maddie    false    205            {           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          maddie    false    204            �            1259    17344 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    maddie    false            �            1259    17354    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    maddie    false            �            1259    17352    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          maddie    false    213            |           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          maddie    false    212            �            1259    17342    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          maddie    false    211            }           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          maddie    false    210            �            1259    17362    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    maddie    false            �            1259    17360 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          maddie    false    215            ~           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          maddie    false    214            �            1259    17647    calidad    TABLE     �   CREATE TABLE public.calidad (
    id integer NOT NULL,
    nivel character varying(100) NOT NULL,
    descripcion text NOT NULL
);
    DROP TABLE public.calidad;
       public         heap    maddie    false            �            1259    17645    calidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.calidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.calidad_id_seq;
       public          maddie    false    237                       0    0    calidad_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.calidad_id_seq OWNED BY public.calidad.id;
          public          maddie    false    236            �            1259    17658 	   categoria    TABLE     �   CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    destacado boolean NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    maddie    false            �            1259    17656    categoria_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.categoria_id_seq;
       public          maddie    false    239            �           0    0    categoria_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;
          public          maddie    false    238            �            1259    17494    ciudad    TABLE     �   CREATE TABLE public.ciudad (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    cpostal_id integer,
    provincia_id integer NOT NULL
);
    DROP TABLE public.ciudad;
       public         heap    maddie    false            �            1259    17492    ciudad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ciudad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.ciudad_id_seq;
       public          maddie    false    225            �           0    0    ciudad_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.ciudad_id_seq OWNED BY public.ciudad.id;
          public          maddie    false    224            �            1259    17774    codigo_descuento    TABLE     �   CREATE TABLE public.codigo_descuento (
    id integer NOT NULL,
    codigo character varying(250) NOT NULL,
    nombre character varying(250) NOT NULL,
    valor integer,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL
);
 $   DROP TABLE public.codigo_descuento;
       public         heap    maddie    false            �            1259    17772    codigo_descuento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.codigo_descuento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.codigo_descuento_id_seq;
       public          maddie    false    251            �           0    0    codigo_descuento_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.codigo_descuento_id_seq OWNED BY public.codigo_descuento.id;
          public          maddie    false    250            �            1259    17476    codigo_postal    TABLE     k   CREATE TABLE public.codigo_postal (
    id integer NOT NULL,
    codigo character varying(100) NOT NULL
);
 !   DROP TABLE public.codigo_postal;
       public         heap    maddie    false            �            1259    17474    codigo_postal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.codigo_postal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.codigo_postal_id_seq;
       public          maddie    false    221            �           0    0    codigo_postal_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.codigo_postal_id_seq OWNED BY public.codigo_postal.id;
          public          maddie    false    220                       1259    17888    combo    TABLE       CREATE TABLE public.combo (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text NOT NULL,
    disponible boolean NOT NULL,
    pganancia integer,
    preciofinal double precision,
    stock integer NOT NULL,
    imagen character varying(100)
);
    DROP TABLE public.combo;
       public         heap    maddie    false                       1259    17886    combo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.combo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.combo_id_seq;
       public          maddie    false    261            �           0    0    combo_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.combo_id_seq OWNED BY public.combo.id;
          public          maddie    false    260                       1259    17901    combo_producto    TABLE     �   CREATE TABLE public.combo_producto (
    id integer NOT NULL,
    unidades integer NOT NULL,
    subtotal double precision,
    combo_id integer,
    producto_id integer NOT NULL
);
 "   DROP TABLE public.combo_producto;
       public         heap    maddie    false                       1259    17899    combo_producto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.combo_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.combo_producto_id_seq;
       public          maddie    false    263            �           0    0    combo_producto_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.combo_producto_id_seq OWNED BY public.combo_producto.id;
          public          maddie    false    262            �            1259    17516    consulta_usuario    TABLE     �   CREATE TABLE public.consulta_usuario (
    id integer NOT NULL,
    motivo character varying(300) NOT NULL,
    mensaje text NOT NULL,
    usuario_id integer NOT NULL,
    fecha date,
    respondida boolean
);
 $   DROP TABLE public.consulta_usuario;
       public         heap    maddie    false            �            1259    17514    consulta_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.consulta_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.consulta_usuario_id_seq;
       public          maddie    false    227            �           0    0    consulta_usuario_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.consulta_usuario_id_seq OWNED BY public.consulta_usuario.id;
          public          maddie    false    226            !           1259    24677    detalle_codigodescuento    TABLE       CREATE TABLE public.detalle_codigodescuento (
    id integer NOT NULL,
    fecha date NOT NULL,
    codigo_id integer,
    porcentaje integer NOT NULL,
    descuento_aplicado double precision,
    usuario_id integer,
    codigo_texto character varying(300)
);
 +   DROP TABLE public.detalle_codigodescuento;
       public         heap    maddie    false                        1259    24675    detalle_codigodescuento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_codigodescuento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.detalle_codigodescuento_id_seq;
       public          maddie    false    289            �           0    0    detalle_codigodescuento_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.detalle_codigodescuento_id_seq OWNED BY public.detalle_codigodescuento.id;
          public          maddie    false    288            �            1259    17798    detalle_giftcard    TABLE     e  CREATE TABLE public.detalle_giftcard (
    id integer NOT NULL,
    usado boolean NOT NULL,
    nombre_amigo character varying(250),
    correo_amigo character varying(300),
    nro_tarjeta integer,
    codigo_seguridad integer,
    giftcard_id integer,
    usuario_id integer,
    valor_descuento double precision,
    creacion timestamp with time zone
);
 $   DROP TABLE public.detalle_giftcard;
       public         heap    maddie    false            �            1259    17796    detalle_giftcard_id_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_giftcard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.detalle_giftcard_id_seq;
       public          maddie    false    255            �           0    0    detalle_giftcard_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.detalle_giftcard_id_seq OWNED BY public.detalle_giftcard.id;
          public          maddie    false    254                       1259    17946    detalle_pedido    TABLE     k  CREATE TABLE public.detalle_pedido (
    id integer NOT NULL,
    tipo_detalle character varying(250),
    cantidad integer NOT NULL,
    creacion timestamp with time zone NOT NULL,
    combo_id integer,
    giftcard_id integer,
    pedido_id integer NOT NULL,
    producto_id integer,
    precio_venta_unitario double precision,
    subtotal double precision
);
 "   DROP TABLE public.detalle_pedido;
       public         heap    maddie    false            #           1259    24853    detalle_pedido_giftcards    TABLE     �   CREATE TABLE public.detalle_pedido_giftcards (
    id integer NOT NULL,
    detallegift_id integer NOT NULL,
    pedido_id integer NOT NULL
);
 ,   DROP TABLE public.detalle_pedido_giftcards;
       public         heap    maddie    false            "           1259    24851    detalle_pedido_giftcards_id_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_pedido_giftcards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.detalle_pedido_giftcards_id_seq;
       public          maddie    false    291            �           0    0    detalle_pedido_giftcards_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.detalle_pedido_giftcards_id_seq OWNED BY public.detalle_pedido_giftcards.id;
          public          maddie    false    290                       1259    17944    detalle_pedido_id_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.detalle_pedido_id_seq;
       public          maddie    false    269            �           0    0    detalle_pedido_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.detalle_pedido_id_seq OWNED BY public.detalle_pedido.id;
          public          maddie    false    268            �            1259    17555    direccion_usuario    TABLE     o  CREATE TABLE public.direccion_usuario (
    id integer NOT NULL,
    telefono character varying(150) NOT NULL,
    direccion character varying(200) NOT NULL,
    numero integer NOT NULL,
    piso_departamento character varying(100) NOT NULL,
    destacada boolean NOT NULL,
    ciudad_id integer NOT NULL,
    provincia_id integer NOT NULL,
    usuario_id integer
);
 %   DROP TABLE public.direccion_usuario;
       public         heap    maddie    false            �            1259    17553    direccion_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.direccion_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.direccion_usuario_id_seq;
       public          maddie    false    233            �           0    0    direccion_usuario_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.direccion_usuario_id_seq OWNED BY public.direccion_usuario.id;
          public          maddie    false    232            �            1259    17422    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    maddie    false            �            1259    17420    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          maddie    false    217            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          maddie    false    216            �            1259    17308    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    maddie    false            �            1259    17306    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          maddie    false    203            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          maddie    false    202            �            1259    17297    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    maddie    false            �            1259    17295    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          maddie    false    201            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          maddie    false    200                       1259    18049    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    maddie    false                       1259    17839    envio    TABLE     �  CREATE TABLE public.envio (
    id integer NOT NULL,
    direccion character varying(250) NOT NULL,
    estado boolean NOT NULL,
    codigo_seguimiento character varying(100),
    precio_envio double precision NOT NULL,
    ciudad_id integer NOT NULL,
    provincia_id integer NOT NULL,
    transporte_id integer NOT NULL,
    usuario_id integer NOT NULL,
    celular character varying(300)
);
    DROP TABLE public.envio;
       public         heap    maddie    false                       1259    17837    envio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.envio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.envio_id_seq;
       public          maddie    false    259            �           0    0    envio_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.envio_id_seq OWNED BY public.envio.id;
          public          maddie    false    258            �            1259    17787 	   gift_card    TABLE     r  CREATE TABLE public.gift_card (
    id integer NOT NULL,
    nombre character varying(250) NOT NULL,
    descripcion text NOT NULL,
    slug character varying(50) NOT NULL,
    preciofinal integer NOT NULL,
    disponible boolean,
    stock integer NOT NULL,
    temporada character varying(250),
    imagen character varying(100),
    imagen2 character varying(100)
);
    DROP TABLE public.gift_card;
       public         heap    maddie    false            �            1259    17785    gift_card_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gift_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.gift_card_id_seq;
       public          maddie    false    253            �           0    0    gift_card_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.gift_card_id_seq OWNED BY public.gift_card.id;
          public          maddie    false    252                       1259    18001    lovelist    TABLE     �   CREATE TABLE public.lovelist (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    usuario_id integer NOT NULL
);
    DROP TABLE public.lovelist;
       public         heap    maddie    false                       1259    17999    lovelist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lovelist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.lovelist_id_seq;
       public          maddie    false    271            �           0    0    lovelist_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.lovelist_id_seq OWNED BY public.lovelist.id;
          public          maddie    false    270                       1259    18011    lovelist_producto    TABLE     u   CREATE TABLE public.lovelist_producto (
    id integer NOT NULL,
    lovelist_id integer,
    producto_id integer
);
 %   DROP TABLE public.lovelist_producto;
       public         heap    maddie    false                       1259    18009    lovelist_producto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lovelist_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.lovelist_producto_id_seq;
       public          maddie    false    273            �           0    0    lovelist_producto_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.lovelist_producto_id_seq OWNED BY public.lovelist_producto.id;
          public          maddie    false    272            �            1259    17668    marca    TABLE     c   CREATE TABLE public.marca (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.marca;
       public         heap    maddie    false            �            1259    17666    marca_id_seq    SEQUENCE     �   CREATE SEQUENCE public.marca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.marca_id_seq;
       public          maddie    false    241            �           0    0    marca_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.marca_id_seq OWNED BY public.marca.id;
          public          maddie    false    240            �            1259    17688    marca_modelo    TABLE     }   CREATE TABLE public.marca_modelo (
    id integer NOT NULL,
    marca_id integer NOT NULL,
    modelo_id integer NOT NULL
);
     DROP TABLE public.marca_modelo;
       public         heap    maddie    false            �            1259    17686    marca_modelo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.marca_modelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.marca_modelo_id_seq;
       public          maddie    false    245            �           0    0    marca_modelo_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.marca_modelo_id_seq OWNED BY public.marca_modelo.id;
          public          maddie    false    244            �            1259    17678    modelo    TABLE     z   CREATE TABLE public.modelo (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    marca_id integer
);
    DROP TABLE public.modelo;
       public         heap    maddie    false            �            1259    17676    modelo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.modelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.modelo_id_seq;
       public          maddie    false    243            �           0    0    modelo_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.modelo_id_seq OWNED BY public.modelo.id;
          public          maddie    false    242            	           1259    17922    pago    TABLE     +  CREATE TABLE public.pago (
    id integer NOT NULL,
    formapago character varying(200) NOT NULL,
    fechapago date,
    confirmado boolean NOT NULL,
    estado character varying(300),
    tipopago character varying(200),
    id_pagomp character varying(300),
    url_mp character varying(200)
);
    DROP TABLE public.pago;
       public         heap    maddie    false                       1259    17920    pago_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.pago_id_seq;
       public          maddie    false    265            �           0    0    pago_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.pago_id_seq OWNED BY public.pago.id;
          public          maddie    false    264                       1259    17933    pedido    TABLE     �  CREATE TABLE public.pedido (
    id integer NOT NULL,
    confirmado boolean,
    estado_armado character varying(250),
    creacion timestamp with time zone NOT NULL,
    montofinal double precision NOT NULL,
    estado character varying(250),
    codigo_descuento_id integer,
    envio_id integer,
    pago_id integer,
    usuario_id integer NOT NULL,
    giftcard_descuento_id integer,
    recibido boolean
);
    DROP TABLE public.pedido;
       public         heap    maddie    false            
           1259    17931    pedido_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.pedido_id_seq;
       public          maddie    false    267            �           0    0    pedido_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.pedido_id_seq OWNED BY public.pedido.id;
          public          maddie    false    266            �            1259    17540    perfil_usuario    TABLE     3  CREATE TABLE public.perfil_usuario (
    id integer NOT NULL,
    dni integer,
    fnacimiento date,
    sexo character varying(100),
    fotoperfil character varying(100),
    ciudad_id integer NOT NULL,
    provincia_id integer NOT NULL,
    usuario_id integer,
    tipo_usuario character varying(100)
);
 "   DROP TABLE public.perfil_usuario;
       public         heap    maddie    false            �            1259    17538    perfil_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.perfil_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.perfil_usuario_id_seq;
       public          maddie    false    231            �           0    0    perfil_usuario_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.perfil_usuario_id_seq OWNED BY public.perfil_usuario.id;
          public          maddie    false    230                       1259    24591    pregunta_frecuente    TABLE       CREATE TABLE public.pregunta_frecuente (
    id integer NOT NULL,
    pregunta character varying(250) NOT NULL,
    categoria character varying(250) NOT NULL,
    respuesta text NOT NULL,
    relevancia character varying(250) NOT NULL,
    destacada boolean NOT NULL
);
 &   DROP TABLE public.pregunta_frecuente;
       public         heap    maddie    false                       1259    24589    pregunta_frecuente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pregunta_frecuente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pregunta_frecuente_id_seq;
       public          maddie    false    283            �           0    0    pregunta_frecuente_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.pregunta_frecuente_id_seq OWNED BY public.pregunta_frecuente.id;
          public          maddie    false    282                       1259    18036    preventconcurrentlogins_visitor    TABLE     �   CREATE TABLE public.preventconcurrentlogins_visitor (
    id integer NOT NULL,
    session_key character varying(40) NOT NULL,
    user_id integer NOT NULL
);
 3   DROP TABLE public.preventconcurrentlogins_visitor;
       public         heap    maddie    false                       1259    18034 &   preventconcurrentlogins_visitor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.preventconcurrentlogins_visitor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.preventconcurrentlogins_visitor_id_seq;
       public          maddie    false    275            �           0    0 &   preventconcurrentlogins_visitor_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.preventconcurrentlogins_visitor_id_seq OWNED BY public.preventconcurrentlogins_visitor.id;
          public          maddie    false    274            �            1259    17717    producto    TABLE     �  CREATE TABLE public.producto (
    id integer NOT NULL,
    nombre character varying(300) NOT NULL,
    slug character varying(50),
    descripcion text NOT NULL,
    resumen text,
    stock integer NOT NULL,
    fechaprecio date,
    preciocosto double precision,
    ganancia integer,
    valorenvio integer,
    preciofinal double precision,
    disponible boolean,
    imagen1 character varying(100),
    imagen2 character varying(100),
    imagen3 character varying(100),
    calidad_id integer NOT NULL,
    categoria_id integer NOT NULL,
    marca_id integer NOT NULL,
    modelo_id integer NOT NULL,
    destacado boolean NOT NULL
);
    DROP TABLE public.producto;
       public         heap    maddie    false            �            1259    17715    producto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.producto_id_seq;
       public          maddie    false    247            �           0    0    producto_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;
          public          maddie    false    246            �            1259    17728    producto_proveedor    TABLE     �   CREATE TABLE public.producto_proveedor (
    id integer NOT NULL,
    producto_id integer NOT NULL,
    proveedor_id integer NOT NULL
);
 &   DROP TABLE public.producto_proveedor;
       public         heap    maddie    false            �            1259    17726    producto_proveedor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.producto_proveedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.producto_proveedor_id_seq;
       public          maddie    false    249            �           0    0    producto_proveedor_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.producto_proveedor_id_seq OWNED BY public.producto_proveedor.id;
          public          maddie    false    248            �            1259    17621 	   proveedor    TABLE     �  CREATE TABLE public.proveedor (
    id integer NOT NULL,
    razonsocial character varying(100) NOT NULL,
    cuit character varying(200),
    tipo character varying(200),
    direccion character varying(200) NOT NULL,
    email character varying(254) NOT NULL,
    telefono character varying(200),
    contacto character varying(100) NOT NULL,
    ciudad_id integer NOT NULL,
    provincia_id integer NOT NULL
);
    DROP TABLE public.proveedor;
       public         heap    maddie    false            �            1259    17619    proveedor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.proveedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.proveedor_id_seq;
       public          maddie    false    235            �           0    0    proveedor_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.proveedor_id_seq OWNED BY public.proveedor.id;
          public          maddie    false    234            �            1259    17484 	   provincia    TABLE     g   CREATE TABLE public.provincia (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.provincia;
       public         heap    maddie    false            �            1259    17482    provincia_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provincia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.provincia_id_seq;
       public          maddie    false    223            �           0    0    provincia_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.provincia_id_seq OWNED BY public.provincia.id;
          public          maddie    false    222                       1259    24602    proximos-pedidos    TABLE       CREATE TABLE public."proximos-pedidos" (
    id integer NOT NULL,
    titulo character varying(250) NOT NULL,
    fecha_d date NOT NULL,
    fecha_h date NOT NULL,
    listado text NOT NULL,
    detalles text NOT NULL,
    link_publicacion character varying(200) NOT NULL
);
 &   DROP TABLE public."proximos-pedidos";
       public         heap    maddie    false                       1259    24600    proximos-pedidos_id_seq    SEQUENCE     �   CREATE SEQUENCE public."proximos-pedidos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."proximos-pedidos_id_seq";
       public          maddie    false    285            �           0    0    proximos-pedidos_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."proximos-pedidos_id_seq" OWNED BY public."proximos-pedidos".id;
          public          maddie    false    284                       1259    18102    recomendados    TABLE     �   CREATE TABLE public.recomendados (
    id integer NOT NULL,
    cantidad integer NOT NULL,
    fecha date NOT NULL,
    producto_id integer
);
     DROP TABLE public.recomendados;
       public         heap    maddie    false                       1259    18100     recomendados_recomendados_id_seq    SEQUENCE     �   CREATE SEQUENCE public.recomendados_recomendados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.recomendados_recomendados_id_seq;
       public          maddie    false    281            �           0    0     recomendados_recomendados_id_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public.recomendados_recomendados_id_seq OWNED BY public.recomendados.id;
          public          maddie    false    280            �            1259    17527    respuesta_usuario    TABLE     �   CREATE TABLE public.respuesta_usuario (
    id integer NOT NULL,
    mensaje text NOT NULL,
    consulta_id integer,
    fecha date,
    visto_mensaje boolean NOT NULL
);
 %   DROP TABLE public.respuesta_usuario;
       public         heap    maddie    false            �            1259    17525    respuesta_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.respuesta_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.respuesta_usuario_id_seq;
       public          maddie    false    229            �           0    0    respuesta_usuario_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.respuesta_usuario_id_seq OWNED BY public.respuesta_usuario.id;
          public          maddie    false    228                       1259    18071    test_producto    TABLE     �   CREATE TABLE public.test_producto (
    id integer NOT NULL,
    tipo_piel character varying(250) NOT NULL,
    color_piel character varying(250) NOT NULL,
    paleta_color character varying(250) NOT NULL,
    producto_id integer
);
 !   DROP TABLE public.test_producto;
       public         heap    maddie    false                       1259    18069    test_producto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.test_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.test_producto_id_seq;
       public          maddie    false    279            �           0    0    test_producto_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.test_producto_id_seq OWNED BY public.test_producto.id;
          public          maddie    false    278                       1259    18059    thumbnail_kvstore    TABLE     l   CREATE TABLE public.thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);
 %   DROP TABLE public.thumbnail_kvstore;
       public         heap    maddie    false                       1259    24654    token    TABLE     �   CREATE TABLE public.token (
    id integer NOT NULL,
    token character varying(300) NOT NULL,
    evento character varying(300) NOT NULL,
    pedido_id integer,
    usuario_id integer NOT NULL
);
    DROP TABLE public.token;
       public         heap    maddie    false                       1259    24652    token_id_seq    SEQUENCE     �   CREATE SEQUENCE public.token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.token_id_seq;
       public          maddie    false    287            �           0    0    token_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.token_id_seq OWNED BY public.token.id;
          public          maddie    false    286                       1259    17824 
   transporte    TABLE     �  CREATE TABLE public.transporte (
    id integer NOT NULL,
    nombre character varying(250) NOT NULL,
    tipo character varying(100),
    direccion character varying(250) NOT NULL,
    telefono integer NOT NULL,
    email character varying(250) NOT NULL,
    precio_servicio double precision,
    ciudad_id integer,
    provincia_id integer,
    plazo_entrega character varying(250)
);
    DROP TABLE public.transporte;
       public         heap    maddie    false                        1259    17822    transporte_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transporte_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.transporte_id_seq;
       public          maddie    false    257            �           0    0    transporte_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.transporte_id_seq OWNED BY public.transporte.id;
          public          maddie    false    256            T           2604    17449    admin_interface_theme id    DEFAULT     �   ALTER TABLE ONLY public.admin_interface_theme ALTER COLUMN id SET DEFAULT nextval('public.admin_interface_theme_id_seq'::regclass);
 G   ALTER TABLE public.admin_interface_theme ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    219    218    219            M           2604    17329    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    207    206    207            N           2604    17339    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    209    208    209            L           2604    17321    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    205    204    205            O           2604    17347    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    211    210    211            P           2604    17357    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    213    212    213            Q           2604    17365    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    214    215    215            ]           2604    17650 
   calidad id    DEFAULT     h   ALTER TABLE ONLY public.calidad ALTER COLUMN id SET DEFAULT nextval('public.calidad_id_seq'::regclass);
 9   ALTER TABLE public.calidad ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    236    237    237            ^           2604    17661    categoria id    DEFAULT     l   ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);
 ;   ALTER TABLE public.categoria ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    239    238    239            W           2604    17497 	   ciudad id    DEFAULT     f   ALTER TABLE ONLY public.ciudad ALTER COLUMN id SET DEFAULT nextval('public.ciudad_id_seq'::regclass);
 8   ALTER TABLE public.ciudad ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    225    224    225            d           2604    17777    codigo_descuento id    DEFAULT     z   ALTER TABLE ONLY public.codigo_descuento ALTER COLUMN id SET DEFAULT nextval('public.codigo_descuento_id_seq'::regclass);
 B   ALTER TABLE public.codigo_descuento ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    251    250    251            U           2604    17479    codigo_postal id    DEFAULT     t   ALTER TABLE ONLY public.codigo_postal ALTER COLUMN id SET DEFAULT nextval('public.codigo_postal_id_seq'::regclass);
 ?   ALTER TABLE public.codigo_postal ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    220    221    221            i           2604    17891    combo id    DEFAULT     d   ALTER TABLE ONLY public.combo ALTER COLUMN id SET DEFAULT nextval('public.combo_id_seq'::regclass);
 7   ALTER TABLE public.combo ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    261    260    261            j           2604    17904    combo_producto id    DEFAULT     v   ALTER TABLE ONLY public.combo_producto ALTER COLUMN id SET DEFAULT nextval('public.combo_producto_id_seq'::regclass);
 @   ALTER TABLE public.combo_producto ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    262    263    263            X           2604    17519    consulta_usuario id    DEFAULT     z   ALTER TABLE ONLY public.consulta_usuario ALTER COLUMN id SET DEFAULT nextval('public.consulta_usuario_id_seq'::regclass);
 B   ALTER TABLE public.consulta_usuario ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    227    226    227            v           2604    24680    detalle_codigodescuento id    DEFAULT     �   ALTER TABLE ONLY public.detalle_codigodescuento ALTER COLUMN id SET DEFAULT nextval('public.detalle_codigodescuento_id_seq'::regclass);
 I   ALTER TABLE public.detalle_codigodescuento ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    289    288    289            f           2604    17801    detalle_giftcard id    DEFAULT     z   ALTER TABLE ONLY public.detalle_giftcard ALTER COLUMN id SET DEFAULT nextval('public.detalle_giftcard_id_seq'::regclass);
 B   ALTER TABLE public.detalle_giftcard ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    254    255    255            m           2604    17949    detalle_pedido id    DEFAULT     v   ALTER TABLE ONLY public.detalle_pedido ALTER COLUMN id SET DEFAULT nextval('public.detalle_pedido_id_seq'::regclass);
 @   ALTER TABLE public.detalle_pedido ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    269    268    269            w           2604    24856    detalle_pedido_giftcards id    DEFAULT     �   ALTER TABLE ONLY public.detalle_pedido_giftcards ALTER COLUMN id SET DEFAULT nextval('public.detalle_pedido_giftcards_id_seq'::regclass);
 J   ALTER TABLE public.detalle_pedido_giftcards ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    291    290    291            [           2604    17558    direccion_usuario id    DEFAULT     |   ALTER TABLE ONLY public.direccion_usuario ALTER COLUMN id SET DEFAULT nextval('public.direccion_usuario_id_seq'::regclass);
 C   ALTER TABLE public.direccion_usuario ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    232    233    233            R           2604    17425    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    216    217    217            K           2604    17311    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    203    202    203            J           2604    17300    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    201    200    201            h           2604    17842    envio id    DEFAULT     d   ALTER TABLE ONLY public.envio ALTER COLUMN id SET DEFAULT nextval('public.envio_id_seq'::regclass);
 7   ALTER TABLE public.envio ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    259    258    259            e           2604    17790    gift_card id    DEFAULT     l   ALTER TABLE ONLY public.gift_card ALTER COLUMN id SET DEFAULT nextval('public.gift_card_id_seq'::regclass);
 ;   ALTER TABLE public.gift_card ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    252    253    253            n           2604    18004    lovelist id    DEFAULT     j   ALTER TABLE ONLY public.lovelist ALTER COLUMN id SET DEFAULT nextval('public.lovelist_id_seq'::regclass);
 :   ALTER TABLE public.lovelist ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    271    270    271            o           2604    18014    lovelist_producto id    DEFAULT     |   ALTER TABLE ONLY public.lovelist_producto ALTER COLUMN id SET DEFAULT nextval('public.lovelist_producto_id_seq'::regclass);
 C   ALTER TABLE public.lovelist_producto ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    273    272    273            _           2604    17671    marca id    DEFAULT     d   ALTER TABLE ONLY public.marca ALTER COLUMN id SET DEFAULT nextval('public.marca_id_seq'::regclass);
 7   ALTER TABLE public.marca ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    241    240    241            a           2604    17691    marca_modelo id    DEFAULT     r   ALTER TABLE ONLY public.marca_modelo ALTER COLUMN id SET DEFAULT nextval('public.marca_modelo_id_seq'::regclass);
 >   ALTER TABLE public.marca_modelo ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    245    244    245            `           2604    17681 	   modelo id    DEFAULT     f   ALTER TABLE ONLY public.modelo ALTER COLUMN id SET DEFAULT nextval('public.modelo_id_seq'::regclass);
 8   ALTER TABLE public.modelo ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    242    243    243            k           2604    17925    pago id    DEFAULT     b   ALTER TABLE ONLY public.pago ALTER COLUMN id SET DEFAULT nextval('public.pago_id_seq'::regclass);
 6   ALTER TABLE public.pago ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    265    264    265            l           2604    17936 	   pedido id    DEFAULT     f   ALTER TABLE ONLY public.pedido ALTER COLUMN id SET DEFAULT nextval('public.pedido_id_seq'::regclass);
 8   ALTER TABLE public.pedido ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    267    266    267            Z           2604    17543    perfil_usuario id    DEFAULT     v   ALTER TABLE ONLY public.perfil_usuario ALTER COLUMN id SET DEFAULT nextval('public.perfil_usuario_id_seq'::regclass);
 @   ALTER TABLE public.perfil_usuario ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    230    231    231            s           2604    24594    pregunta_frecuente id    DEFAULT     ~   ALTER TABLE ONLY public.pregunta_frecuente ALTER COLUMN id SET DEFAULT nextval('public.pregunta_frecuente_id_seq'::regclass);
 D   ALTER TABLE public.pregunta_frecuente ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    282    283    283            p           2604    18039 "   preventconcurrentlogins_visitor id    DEFAULT     �   ALTER TABLE ONLY public.preventconcurrentlogins_visitor ALTER COLUMN id SET DEFAULT nextval('public.preventconcurrentlogins_visitor_id_seq'::regclass);
 Q   ALTER TABLE public.preventconcurrentlogins_visitor ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    274    275    275            b           2604    17720    producto id    DEFAULT     j   ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);
 :   ALTER TABLE public.producto ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    247    246    247            c           2604    17731    producto_proveedor id    DEFAULT     ~   ALTER TABLE ONLY public.producto_proveedor ALTER COLUMN id SET DEFAULT nextval('public.producto_proveedor_id_seq'::regclass);
 D   ALTER TABLE public.producto_proveedor ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    248    249    249            \           2604    17624    proveedor id    DEFAULT     l   ALTER TABLE ONLY public.proveedor ALTER COLUMN id SET DEFAULT nextval('public.proveedor_id_seq'::regclass);
 ;   ALTER TABLE public.proveedor ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    235    234    235            V           2604    17487    provincia id    DEFAULT     l   ALTER TABLE ONLY public.provincia ALTER COLUMN id SET DEFAULT nextval('public.provincia_id_seq'::regclass);
 ;   ALTER TABLE public.provincia ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    222    223    223            t           2604    24605    proximos-pedidos id    DEFAULT     ~   ALTER TABLE ONLY public."proximos-pedidos" ALTER COLUMN id SET DEFAULT nextval('public."proximos-pedidos_id_seq"'::regclass);
 D   ALTER TABLE public."proximos-pedidos" ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    285    284    285            r           2604    18105    recomendados id    DEFAULT        ALTER TABLE ONLY public.recomendados ALTER COLUMN id SET DEFAULT nextval('public.recomendados_recomendados_id_seq'::regclass);
 >   ALTER TABLE public.recomendados ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    281    280    281            Y           2604    17530    respuesta_usuario id    DEFAULT     |   ALTER TABLE ONLY public.respuesta_usuario ALTER COLUMN id SET DEFAULT nextval('public.respuesta_usuario_id_seq'::regclass);
 C   ALTER TABLE public.respuesta_usuario ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    228    229    229            q           2604    18074    test_producto id    DEFAULT     t   ALTER TABLE ONLY public.test_producto ALTER COLUMN id SET DEFAULT nextval('public.test_producto_id_seq'::regclass);
 ?   ALTER TABLE public.test_producto ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    278    279    279            u           2604    24657    token id    DEFAULT     d   ALTER TABLE ONLY public.token ALTER COLUMN id SET DEFAULT nextval('public.token_id_seq'::regclass);
 7   ALTER TABLE public.token ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    287    286    287            g           2604    17827    transporte id    DEFAULT     n   ALTER TABLE ONLY public.transporte ALTER COLUMN id SET DEFAULT nextval('public.transporte_id_seq'::regclass);
 <   ALTER TABLE public.transporte ALTER COLUMN id DROP DEFAULT;
       public          maddie    false    256    257    257            )          0    17446    admin_interface_theme 
   TABLE DATA           �  COPY public.admin_interface_theme (id, name, active, title, title_visible, logo, logo_visible, css_header_background_color, title_color, css_header_text_color, css_header_link_color, css_header_link_hover_color, css_module_background_color, css_module_text_color, css_module_link_color, css_module_link_hover_color, css_module_rounded_corners, css_generic_link_color, css_generic_link_hover_color, css_save_button_background_color, css_save_button_background_hover_color, css_save_button_text_color, css_delete_button_background_color, css_delete_button_background_hover_color, css_delete_button_text_color, css, list_filter_dropdown, related_modal_active, related_modal_background_color, related_modal_rounded_corners, logo_color, recent_actions_visible, favicon, related_modal_background_opacity, env_name, env_visible_in_header, env_color, env_visible_in_favicon, related_modal_close_button_visible, language_chooser_active, language_chooser_display, list_filter_sticky) FROM stdin;
    public          maddie    false    219   �                0    17326 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          maddie    false    207   ��                0    17336    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          maddie    false    209   ��                0    17318    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          maddie    false    205   ψ      !          0    17344 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          maddie    false    211   ��      #          0    17354    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          maddie    false    213   \�      %          0    17362    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          maddie    false    215   y�      ;          0    17647    calidad 
   TABLE DATA           9   COPY public.calidad (id, nivel, descripcion) FROM stdin;
    public          maddie    false    237   ��      =          0    17658 	   categoria 
   TABLE DATA           :   COPY public.categoria (id, nombre, destacado) FROM stdin;
    public          maddie    false    239   ё      /          0    17494    ciudad 
   TABLE DATA           F   COPY public.ciudad (id, nombre, cpostal_id, provincia_id) FROM stdin;
    public          maddie    false    225   �      I          0    17774    codigo_descuento 
   TABLE DATA           ^   COPY public.codigo_descuento (id, codigo, nombre, valor, fecha_inicio, fecha_fin) FROM stdin;
    public          maddie    false    251   D�      +          0    17476    codigo_postal 
   TABLE DATA           3   COPY public.codigo_postal (id, codigo) FROM stdin;
    public          maddie    false    221   �      S          0    17888    combo 
   TABLE DATA           k   COPY public.combo (id, nombre, descripcion, disponible, pganancia, preciofinal, stock, imagen) FROM stdin;
    public          maddie    false    261   �      U          0    17901    combo_producto 
   TABLE DATA           W   COPY public.combo_producto (id, unidades, subtotal, combo_id, producto_id) FROM stdin;
    public          maddie    false    263   >�      1          0    17516    consulta_usuario 
   TABLE DATA           ^   COPY public.consulta_usuario (id, motivo, mensaje, usuario_id, fecha, respondida) FROM stdin;
    public          maddie    false    227   ��      o          0    24677    detalle_codigodescuento 
   TABLE DATA           �   COPY public.detalle_codigodescuento (id, fecha, codigo_id, porcentaje, descuento_aplicado, usuario_id, codigo_texto) FROM stdin;
    public          maddie    false    289   T�      M          0    17798    detalle_giftcard 
   TABLE DATA           �   COPY public.detalle_giftcard (id, usado, nombre_amigo, correo_amigo, nro_tarjeta, codigo_seguridad, giftcard_id, usuario_id, valor_descuento, creacion) FROM stdin;
    public          maddie    false    255   ޕ      [          0    17946    detalle_pedido 
   TABLE DATA           �   COPY public.detalle_pedido (id, tipo_detalle, cantidad, creacion, combo_id, giftcard_id, pedido_id, producto_id, precio_venta_unitario, subtotal) FROM stdin;
    public          maddie    false    269   ��      q          0    24853    detalle_pedido_giftcards 
   TABLE DATA           Q   COPY public.detalle_pedido_giftcards (id, detallegift_id, pedido_id) FROM stdin;
    public          maddie    false    291   ^�      7          0    17555    direccion_usuario 
   TABLE DATA           �   COPY public.direccion_usuario (id, telefono, direccion, numero, piso_departamento, destacada, ciudad_id, provincia_id, usuario_id) FROM stdin;
    public          maddie    false    233   ��      '          0    17422    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          maddie    false    217   7�                0    17308    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          maddie    false    203   �                0    17297    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          maddie    false    201   ��      b          0    18049    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          maddie    false    276   ��      Q          0    17839    envio 
   TABLE DATA           �   COPY public.envio (id, direccion, estado, codigo_seguimiento, precio_envio, ciudad_id, provincia_id, transporte_id, usuario_id, celular) FROM stdin;
    public          maddie    false    259   ��      K          0    17787 	   gift_card 
   TABLE DATA           ~   COPY public.gift_card (id, nombre, descripcion, slug, preciofinal, disponible, stock, temporada, imagen, imagen2) FROM stdin;
    public          maddie    false    253   ��      ]          0    18001    lovelist 
   TABLE DATA           :   COPY public.lovelist (id, nombre, usuario_id) FROM stdin;
    public          maddie    false    271   c�      _          0    18011    lovelist_producto 
   TABLE DATA           I   COPY public.lovelist_producto (id, lovelist_id, producto_id) FROM stdin;
    public          maddie    false    273   ��      ?          0    17668    marca 
   TABLE DATA           +   COPY public.marca (id, nombre) FROM stdin;
    public          maddie    false    241   ��      C          0    17688    marca_modelo 
   TABLE DATA           ?   COPY public.marca_modelo (id, marca_id, modelo_id) FROM stdin;
    public          maddie    false    245   �      A          0    17678    modelo 
   TABLE DATA           6   COPY public.modelo (id, nombre, marca_id) FROM stdin;
    public          maddie    false    243   #�      W          0    17922    pago 
   TABLE DATA           i   COPY public.pago (id, formapago, fechapago, confirmado, estado, tipopago, id_pagomp, url_mp) FROM stdin;
    public          maddie    false    265   ��      Y          0    17933    pedido 
   TABLE DATA           �   COPY public.pedido (id, confirmado, estado_armado, creacion, montofinal, estado, codigo_descuento_id, envio_id, pago_id, usuario_id, giftcard_descuento_id, recibido) FROM stdin;
    public          maddie    false    267   !�      5          0    17540    perfil_usuario 
   TABLE DATA           �   COPY public.perfil_usuario (id, dni, fnacimiento, sexo, fotoperfil, ciudad_id, provincia_id, usuario_id, tipo_usuario) FROM stdin;
    public          maddie    false    231   ��      i          0    24591    pregunta_frecuente 
   TABLE DATA           g   COPY public.pregunta_frecuente (id, pregunta, categoria, respuesta, relevancia, destacada) FROM stdin;
    public          maddie    false    283   m�      a          0    18036    preventconcurrentlogins_visitor 
   TABLE DATA           S   COPY public.preventconcurrentlogins_visitor (id, session_key, user_id) FROM stdin;
    public          maddie    false    275   L�      E          0    17717    producto 
   TABLE DATA           �   COPY public.producto (id, nombre, slug, descripcion, resumen, stock, fechaprecio, preciocosto, ganancia, valorenvio, preciofinal, disponible, imagen1, imagen2, imagen3, calidad_id, categoria_id, marca_id, modelo_id, destacado) FROM stdin;
    public          maddie    false    247   ��      G          0    17728    producto_proveedor 
   TABLE DATA           K   COPY public.producto_proveedor (id, producto_id, proveedor_id) FROM stdin;
    public          maddie    false    249   "�      9          0    17621 	   proveedor 
   TABLE DATA              COPY public.proveedor (id, razonsocial, cuit, tipo, direccion, email, telefono, contacto, ciudad_id, provincia_id) FROM stdin;
    public          maddie    false    235   S�      -          0    17484 	   provincia 
   TABLE DATA           /   COPY public.provincia (id, nombre) FROM stdin;
    public          maddie    false    223   ��      k          0    24602    proximos-pedidos 
   TABLE DATA           o   COPY public."proximos-pedidos" (id, titulo, fecha_d, fecha_h, listado, detalles, link_publicacion) FROM stdin;
    public          maddie    false    285   ��      g          0    18102    recomendados 
   TABLE DATA           H   COPY public.recomendados (id, cantidad, fecha, producto_id) FROM stdin;
    public          maddie    false    281   �      3          0    17527    respuesta_usuario 
   TABLE DATA           [   COPY public.respuesta_usuario (id, mensaje, consulta_id, fecha, visto_mensaje) FROM stdin;
    public          maddie    false    229   H�      e          0    18071    test_producto 
   TABLE DATA           ]   COPY public.test_producto (id, tipo_piel, color_piel, paleta_color, producto_id) FROM stdin;
    public          maddie    false    279   ��      c          0    18059    thumbnail_kvstore 
   TABLE DATA           7   COPY public.thumbnail_kvstore (key, value) FROM stdin;
    public          maddie    false    277   �      m          0    24654    token 
   TABLE DATA           I   COPY public.token (id, token, evento, pedido_id, usuario_id) FROM stdin;
    public          maddie    false    287   9�      O          0    17824 
   transporte 
   TABLE DATA           �   COPY public.transporte (id, nombre, tipo, direccion, telefono, email, precio_servicio, ciudad_id, provincia_id, plazo_entrega) FROM stdin;
    public          maddie    false    257   j�      �           0    0    admin_interface_theme_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.admin_interface_theme_id_seq', 2, true);
          public          maddie    false    218            �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          maddie    false    206            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          maddie    false    208            �           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 172, true);
          public          maddie    false    204            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          maddie    false    212            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 42, true);
          public          maddie    false    210            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          maddie    false    214            �           0    0    calidad_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.calidad_id_seq', 2, true);
          public          maddie    false    236            �           0    0    categoria_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.categoria_id_seq', 4, true);
          public          maddie    false    238            �           0    0    ciudad_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.ciudad_id_seq', 1, true);
          public          maddie    false    224            �           0    0    codigo_descuento_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.codigo_descuento_id_seq', 4, true);
          public          maddie    false    250            �           0    0    codigo_postal_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.codigo_postal_id_seq', 2, true);
          public          maddie    false    220            �           0    0    combo_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.combo_id_seq', 15, true);
          public          maddie    false    260            �           0    0    combo_producto_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.combo_producto_id_seq', 39, true);
          public          maddie    false    262            �           0    0    consulta_usuario_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.consulta_usuario_id_seq', 10, true);
          public          maddie    false    226            �           0    0    detalle_codigodescuento_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.detalle_codigodescuento_id_seq', 18, true);
          public          maddie    false    288            �           0    0    detalle_giftcard_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.detalle_giftcard_id_seq', 59, true);
          public          maddie    false    254            �           0    0    detalle_pedido_giftcards_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.detalle_pedido_giftcards_id_seq', 9, true);
          public          maddie    false    290            �           0    0    detalle_pedido_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.detalle_pedido_id_seq', 204, true);
          public          maddie    false    268            �           0    0    direccion_usuario_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.direccion_usuario_id_seq', 7, true);
          public          maddie    false    232            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 729, true);
          public          maddie    false    216            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 43, true);
          public          maddie    false    202            �           0    0    django_migrations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.django_migrations_id_seq', 127, true);
          public          maddie    false    200            �           0    0    envio_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.envio_id_seq', 133, true);
          public          maddie    false    258            �           0    0    gift_card_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.gift_card_id_seq', 2, true);
          public          maddie    false    252            �           0    0    lovelist_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.lovelist_id_seq', 3, true);
          public          maddie    false    270            �           0    0    lovelist_producto_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.lovelist_producto_id_seq', 9, true);
          public          maddie    false    272            �           0    0    marca_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.marca_id_seq', 3, true);
          public          maddie    false    240            �           0    0    marca_modelo_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.marca_modelo_id_seq', 1, false);
          public          maddie    false    244            �           0    0    modelo_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.modelo_id_seq', 3, true);
          public          maddie    false    242            �           0    0    pago_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.pago_id_seq', 93, true);
          public          maddie    false    264            �           0    0    pedido_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pedido_id_seq', 122, true);
          public          maddie    false    266            �           0    0    perfil_usuario_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.perfil_usuario_id_seq', 5, true);
          public          maddie    false    230            �           0    0    pregunta_frecuente_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.pregunta_frecuente_id_seq', 6, true);
          public          maddie    false    282            �           0    0 &   preventconcurrentlogins_visitor_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.preventconcurrentlogins_visitor_id_seq', 8, true);
          public          maddie    false    274            �           0    0    producto_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.producto_id_seq', 4, true);
          public          maddie    false    246            �           0    0    producto_proveedor_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.producto_proveedor_id_seq', 4, true);
          public          maddie    false    248            �           0    0    proveedor_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.proveedor_id_seq', 1, true);
          public          maddie    false    234            �           0    0    provincia_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.provincia_id_seq', 2, true);
          public          maddie    false    222            �           0    0    proximos-pedidos_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."proximos-pedidos_id_seq"', 3, true);
          public          maddie    false    284            �           0    0     recomendados_recomendados_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.recomendados_recomendados_id_seq', 55, true);
          public          maddie    false    280            �           0    0    respuesta_usuario_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.respuesta_usuario_id_seq', 8, true);
          public          maddie    false    228            �           0    0    test_producto_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.test_producto_id_seq', 6, true);
          public          maddie    false    278            �           0    0    token_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.token_id_seq', 105, true);
          public          maddie    false    286            �           0    0    transporte_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.transporte_id_seq', 2, true);
          public          maddie    false    256            �           2606    17469 >   admin_interface_theme admin_interface_theme_name_30bda70f_uniq 
   CONSTRAINT     y   ALTER TABLE ONLY public.admin_interface_theme
    ADD CONSTRAINT admin_interface_theme_name_30bda70f_uniq UNIQUE (name);
 h   ALTER TABLE ONLY public.admin_interface_theme DROP CONSTRAINT admin_interface_theme_name_30bda70f_uniq;
       public            maddie    false    219            �           2606    17454 0   admin_interface_theme admin_interface_theme_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.admin_interface_theme
    ADD CONSTRAINT admin_interface_theme_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.admin_interface_theme DROP CONSTRAINT admin_interface_theme_pkey;
       public            maddie    false    219            �           2606    17614    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            maddie    false    207            �           2606    17378 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            maddie    false    209    209            �           2606    17341 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            maddie    false    209            �           2606    17331    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            maddie    false    207            �           2606    17369 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            maddie    false    205    205            �           2606    17323 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            maddie    false    205            �           2606    17617 '   auth_user auth_user_email_1c89df09_uniq 
   CONSTRAINT     c   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_email_1c89df09_uniq UNIQUE (email);
 Q   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_email_1c89df09_uniq;
       public            maddie    false    211            �           2606    17359 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            maddie    false    213            �           2606    17393 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            maddie    false    213    213            �           2606    17349    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            maddie    false    211            �           2606    17367 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            maddie    false    215            �           2606    17407 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            maddie    false    215    215            �           2606    17608     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            maddie    false    211            �           2606    17655    calidad calidad_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.calidad
    ADD CONSTRAINT calidad_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.calidad DROP CONSTRAINT calidad_pkey;
       public            maddie    false    237            �           2606    17665    categoria categoria_nombre_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_nombre_key UNIQUE (nombre);
 H   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_nombre_key;
       public            maddie    false    239            �           2606    17663    categoria categoria_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            maddie    false    239            �           2606    17499    ciudad ciudad_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_pkey;
       public            maddie    false    225            �           2606    17784 ,   codigo_descuento codigo_descuento_codigo_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.codigo_descuento
    ADD CONSTRAINT codigo_descuento_codigo_key UNIQUE (codigo);
 V   ALTER TABLE ONLY public.codigo_descuento DROP CONSTRAINT codigo_descuento_codigo_key;
       public            maddie    false    251            �           2606    17782 &   codigo_descuento codigo_descuento_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.codigo_descuento
    ADD CONSTRAINT codigo_descuento_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.codigo_descuento DROP CONSTRAINT codigo_descuento_pkey;
       public            maddie    false    251            �           2606    17481     codigo_postal codigo_postal_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.codigo_postal
    ADD CONSTRAINT codigo_postal_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.codigo_postal DROP CONSTRAINT codigo_postal_pkey;
       public            maddie    false    221                       2606    17898    combo combo_nombre_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.combo
    ADD CONSTRAINT combo_nombre_key UNIQUE (nombre);
 @   ALTER TABLE ONLY public.combo DROP CONSTRAINT combo_nombre_key;
       public            maddie    false    261                       2606    17896    combo combo_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.combo
    ADD CONSTRAINT combo_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.combo DROP CONSTRAINT combo_pkey;
       public            maddie    false    261                       2606    17906 "   combo_producto combo_producto_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.combo_producto
    ADD CONSTRAINT combo_producto_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.combo_producto DROP CONSTRAINT combo_producto_pkey;
       public            maddie    false    263            �           2606    17524 &   consulta_usuario consulta_usuario_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.consulta_usuario
    ADD CONSTRAINT consulta_usuario_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.consulta_usuario DROP CONSTRAINT consulta_usuario_pkey;
       public            maddie    false    227            Q           2606    24682 4   detalle_codigodescuento detalle_codigodescuento_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.detalle_codigodescuento
    ADD CONSTRAINT detalle_codigodescuento_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.detalle_codigodescuento DROP CONSTRAINT detalle_codigodescuento_pkey;
       public            maddie    false    289            �           2606    17806 &   detalle_giftcard detalle_giftcard_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.detalle_giftcard
    ADD CONSTRAINT detalle_giftcard_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.detalle_giftcard DROP CONSTRAINT detalle_giftcard_pkey;
       public            maddie    false    255            V           2606    24858 6   detalle_pedido_giftcards detalle_pedido_giftcards_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.detalle_pedido_giftcards
    ADD CONSTRAINT detalle_pedido_giftcards_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.detalle_pedido_giftcards DROP CONSTRAINT detalle_pedido_giftcards_pkey;
       public            maddie    false    291            ,           2606    17951 "   detalle_pedido detalle_pedido_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.detalle_pedido DROP CONSTRAINT detalle_pedido_pkey;
       public            maddie    false    269            �           2606    17560 (   direccion_usuario direccion_usuario_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.direccion_usuario
    ADD CONSTRAINT direccion_usuario_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.direccion_usuario DROP CONSTRAINT direccion_usuario_pkey;
       public            maddie    false    233            �           2606    17431 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            maddie    false    217            {           2606    17315 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            maddie    false    203    203            }           2606    17313 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            maddie    false    203            y           2606    17305 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            maddie    false    201            <           2606    18056 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            maddie    false    276                       2606    24790 "   envio envio_codigo_seguimiento_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.envio
    ADD CONSTRAINT envio_codigo_seguimiento_key UNIQUE (codigo_seguimiento);
 L   ALTER TABLE ONLY public.envio DROP CONSTRAINT envio_codigo_seguimiento_key;
       public            maddie    false    259                       2606    17844    envio envio_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.envio
    ADD CONSTRAINT envio_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.envio DROP CONSTRAINT envio_pkey;
       public            maddie    false    259            �           2606    17795    gift_card gift_card_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.gift_card
    ADD CONSTRAINT gift_card_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.gift_card DROP CONSTRAINT gift_card_pkey;
       public            maddie    false    253            /           2606    18006    lovelist lovelist_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.lovelist
    ADD CONSTRAINT lovelist_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.lovelist DROP CONSTRAINT lovelist_pkey;
       public            maddie    false    271            4           2606    18016 (   lovelist_producto lovelist_producto_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.lovelist_producto
    ADD CONSTRAINT lovelist_producto_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.lovelist_producto DROP CONSTRAINT lovelist_producto_pkey;
       public            maddie    false    273            1           2606    18008     lovelist lovelist_usuario_id_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.lovelist
    ADD CONSTRAINT lovelist_usuario_id_key UNIQUE (usuario_id);
 J   ALTER TABLE ONLY public.lovelist DROP CONSTRAINT lovelist_usuario_id_key;
       public            maddie    false    271            �           2606    17693    marca_modelo marca_modelo_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.marca_modelo
    ADD CONSTRAINT marca_modelo_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.marca_modelo DROP CONSTRAINT marca_modelo_pkey;
       public            maddie    false    245            �           2606    17675    marca marca_nombre_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_nombre_key UNIQUE (nombre);
 @   ALTER TABLE ONLY public.marca DROP CONSTRAINT marca_nombre_key;
       public            maddie    false    241            �           2606    17673    marca marca_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.marca DROP CONSTRAINT marca_pkey;
       public            maddie    false    241            �           2606    17685    modelo modelo_nombre_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_nombre_key UNIQUE (nombre);
 B   ALTER TABLE ONLY public.modelo DROP CONSTRAINT modelo_nombre_key;
       public            maddie    false    243            �           2606    17683    modelo modelo_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.modelo DROP CONSTRAINT modelo_pkey;
       public            maddie    false    243                       2606    17930    pago pago_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_pkey;
       public            maddie    false    265                       2606    24719 /   pedido pedido_codigo_descuento_id_929bffa0_uniq 
   CONSTRAINT     y   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_codigo_descuento_id_929bffa0_uniq UNIQUE (codigo_descuento_id);
 Y   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_codigo_descuento_id_929bffa0_uniq;
       public            maddie    false    267            "           2606    24726 1   pedido pedido_giftcard_descuento_id_2b515590_uniq 
   CONSTRAINT     }   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_giftcard_descuento_id_2b515590_uniq UNIQUE (giftcard_descuento_id);
 [   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_giftcard_descuento_id_2b515590_uniq;
       public            maddie    false    267            $           2606    17943    pedido pedido_pago_id_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pago_id_key UNIQUE (pago_id);
 C   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pago_id_key;
       public            maddie    false    267            &           2606    17941    pedido pedido_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            maddie    false    267            �           2606    17550 %   perfil_usuario perfil_usuario_dni_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.perfil_usuario
    ADD CONSTRAINT perfil_usuario_dni_key UNIQUE (dni);
 O   ALTER TABLE ONLY public.perfil_usuario DROP CONSTRAINT perfil_usuario_dni_key;
       public            maddie    false    231            �           2606    17548 "   perfil_usuario perfil_usuario_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.perfil_usuario
    ADD CONSTRAINT perfil_usuario_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.perfil_usuario DROP CONSTRAINT perfil_usuario_pkey;
       public            maddie    false    231            �           2606    17552 ,   perfil_usuario perfil_usuario_usuario_id_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.perfil_usuario
    ADD CONSTRAINT perfil_usuario_usuario_id_key UNIQUE (usuario_id);
 V   ALTER TABLE ONLY public.perfil_usuario DROP CONSTRAINT perfil_usuario_usuario_id_key;
       public            maddie    false    231            H           2606    24599 *   pregunta_frecuente pregunta_frecuente_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.pregunta_frecuente
    ADD CONSTRAINT pregunta_frecuente_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.pregunta_frecuente DROP CONSTRAINT pregunta_frecuente_pkey;
       public            maddie    false    283            7           2606    18041 D   preventconcurrentlogins_visitor preventconcurrentlogins_visitor_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.preventconcurrentlogins_visitor
    ADD CONSTRAINT preventconcurrentlogins_visitor_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.preventconcurrentlogins_visitor DROP CONSTRAINT preventconcurrentlogins_visitor_pkey;
       public            maddie    false    275            9           2606    18043 K   preventconcurrentlogins_visitor preventconcurrentlogins_visitor_user_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.preventconcurrentlogins_visitor
    ADD CONSTRAINT preventconcurrentlogins_visitor_user_id_key UNIQUE (user_id);
 u   ALTER TABLE ONLY public.preventconcurrentlogins_visitor DROP CONSTRAINT preventconcurrentlogins_visitor_user_id_key;
       public            maddie    false    275            �           2606    17725    producto producto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public            maddie    false    247            �           2606    17733 *   producto_proveedor producto_proveedor_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.producto_proveedor
    ADD CONSTRAINT producto_proveedor_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.producto_proveedor DROP CONSTRAINT producto_proveedor_pkey;
       public            maddie    false    249            �           2606    17629    proveedor proveedor_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT proveedor_pkey;
       public            maddie    false    235            �           2606    17631 #   proveedor proveedor_razonsocial_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_razonsocial_key UNIQUE (razonsocial);
 M   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT proveedor_razonsocial_key;
       public            maddie    false    235            �           2606    17491    provincia provincia_nombre_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT provincia_nombre_key UNIQUE (nombre);
 H   ALTER TABLE ONLY public.provincia DROP CONSTRAINT provincia_nombre_key;
       public            maddie    false    223            �           2606    17489    provincia provincia_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.provincia DROP CONSTRAINT provincia_pkey;
       public            maddie    false    223            J           2606    24610 &   proximos-pedidos proximos-pedidos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."proximos-pedidos"
    ADD CONSTRAINT "proximos-pedidos_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."proximos-pedidos" DROP CONSTRAINT "proximos-pedidos_pkey";
       public            maddie    false    285            E           2606    18107 +   recomendados recomendados_recomendados_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.recomendados
    ADD CONSTRAINT recomendados_recomendados_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.recomendados DROP CONSTRAINT recomendados_recomendados_pkey;
       public            maddie    false    281            �           2606    17537 3   respuesta_usuario respuesta_usuario_consulta_id_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.respuesta_usuario
    ADD CONSTRAINT respuesta_usuario_consulta_id_key UNIQUE (consulta_id);
 ]   ALTER TABLE ONLY public.respuesta_usuario DROP CONSTRAINT respuesta_usuario_consulta_id_key;
       public            maddie    false    229            �           2606    17535 (   respuesta_usuario respuesta_usuario_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.respuesta_usuario
    ADD CONSTRAINT respuesta_usuario_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.respuesta_usuario DROP CONSTRAINT respuesta_usuario_pkey;
       public            maddie    false    229            B           2606    18079     test_producto test_producto_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.test_producto
    ADD CONSTRAINT test_producto_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.test_producto DROP CONSTRAINT test_producto_pkey;
       public            maddie    false    279            @           2606    18066 (   thumbnail_kvstore thumbnail_kvstore_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);
 R   ALTER TABLE ONLY public.thumbnail_kvstore DROP CONSTRAINT thumbnail_kvstore_pkey;
       public            maddie    false    277            M           2606    24662    token token_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.token DROP CONSTRAINT token_pkey;
       public            maddie    false    287                       2606    17836 #   transporte transporte_direccion_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.transporte
    ADD CONSTRAINT transporte_direccion_key UNIQUE (direccion);
 M   ALTER TABLE ONLY public.transporte DROP CONSTRAINT transporte_direccion_key;
       public            maddie    false    257                       2606    17834     transporte transporte_nombre_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.transporte
    ADD CONSTRAINT transporte_nombre_key UNIQUE (nombre);
 J   ALTER TABLE ONLY public.transporte DROP CONSTRAINT transporte_nombre_key;
       public            maddie    false    257                       2606    17832    transporte transporte_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.transporte
    ADD CONSTRAINT transporte_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.transporte DROP CONSTRAINT transporte_pkey;
       public            maddie    false    257            �           1259    17470 (   admin_interface_theme_name_30bda70f_like    INDEX     ~   CREATE INDEX admin_interface_theme_name_30bda70f_like ON public.admin_interface_theme USING btree (name varchar_pattern_ops);
 <   DROP INDEX public.admin_interface_theme_name_30bda70f_like;
       public            maddie    false    219            �           1259    17615    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            maddie    false    207            �           1259    17389 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            maddie    false    209            �           1259    17390 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            maddie    false    209            ~           1259    17375 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            maddie    false    205            �           1259    17618    auth_user_email_1c89df09_like    INDEX     h   CREATE INDEX auth_user_email_1c89df09_like ON public.auth_user USING btree (email varchar_pattern_ops);
 1   DROP INDEX public.auth_user_email_1c89df09_like;
       public            maddie    false    211            �           1259    17405 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            maddie    false    213            �           1259    17404 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            maddie    false    213            �           1259    17419 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            maddie    false    215            �           1259    17418 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            maddie    false    215            �           1259    17609     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            maddie    false    211            �           1259    17694    categoria_nombre_872f9ecc_like    INDEX     j   CREATE INDEX categoria_nombre_872f9ecc_like ON public.categoria USING btree (nombre varchar_pattern_ops);
 2   DROP INDEX public.categoria_nombre_872f9ecc_like;
       public            maddie    false    239            �           1259    18093    ciudad_cpostal_id_a10de275    INDEX     S   CREATE INDEX ciudad_cpostal_id_a10de275 ON public.ciudad USING btree (cpostal_id);
 .   DROP INDEX public.ciudad_cpostal_id_a10de275;
       public            maddie    false    225            �           1259    17513    ciudad_provincia_id_3dbe031c    INDEX     W   CREATE INDEX ciudad_provincia_id_3dbe031c ON public.ciudad USING btree (provincia_id);
 0   DROP INDEX public.ciudad_provincia_id_3dbe031c;
       public            maddie    false    225            �           1259    17807 %   codigo_descuento_codigo_b9613def_like    INDEX     x   CREATE INDEX codigo_descuento_codigo_b9613def_like ON public.codigo_descuento USING btree (codigo varchar_pattern_ops);
 9   DROP INDEX public.codigo_descuento_codigo_b9613def_like;
       public            maddie    false    251                       1259    17907    combo_nombre_a56e137c_like    INDEX     b   CREATE INDEX combo_nombre_a56e137c_like ON public.combo USING btree (nombre varchar_pattern_ops);
 .   DROP INDEX public.combo_nombre_a56e137c_like;
       public            maddie    false    261                       1259    17918     combo_producto_combo_id_dbdf3adb    INDEX     _   CREATE INDEX combo_producto_combo_id_dbdf3adb ON public.combo_producto USING btree (combo_id);
 4   DROP INDEX public.combo_producto_combo_id_dbdf3adb;
       public            maddie    false    263                       1259    24770 #   combo_producto_producto_id_44622e1b    INDEX     e   CREATE INDEX combo_producto_producto_id_44622e1b ON public.combo_producto USING btree (producto_id);
 7   DROP INDEX public.combo_producto_producto_id_44622e1b;
       public            maddie    false    263            �           1259    17606 $   consulta_usuario_usuario_id_c7529bed    INDEX     g   CREATE INDEX consulta_usuario_usuario_id_c7529bed ON public.consulta_usuario USING btree (usuario_id);
 8   DROP INDEX public.consulta_usuario_usuario_id_c7529bed;
       public            maddie    false    227            O           1259    24697 *   detalle_codigodescuento_codigo_id_9994810c    INDEX     s   CREATE INDEX detalle_codigodescuento_codigo_id_9994810c ON public.detalle_codigodescuento USING btree (codigo_id);
 >   DROP INDEX public.detalle_codigodescuento_codigo_id_9994810c;
       public            maddie    false    289            R           1259    24688 +   detalle_codigodescuento_usuario_id_158c87f2    INDEX     u   CREATE INDEX detalle_codigodescuento_usuario_id_158c87f2 ON public.detalle_codigodescuento USING btree (usuario_id);
 ?   DROP INDEX public.detalle_codigodescuento_usuario_id_158c87f2;
       public            maddie    false    289            �           1259    17820 %   detalle_giftcard_giftcard_id_fbb4dd59    INDEX     i   CREATE INDEX detalle_giftcard_giftcard_id_fbb4dd59 ON public.detalle_giftcard USING btree (giftcard_id);
 9   DROP INDEX public.detalle_giftcard_giftcard_id_fbb4dd59;
       public            maddie    false    255            �           1259    17821 $   detalle_giftcard_usuario_id_017f6d99    INDEX     g   CREATE INDEX detalle_giftcard_usuario_id_017f6d99 ON public.detalle_giftcard USING btree (usuario_id);
 8   DROP INDEX public.detalle_giftcard_usuario_id_017f6d99;
       public            maddie    false    255            (           1259    17995     detalle_pedido_combo_id_5bbe2a92    INDEX     _   CREATE INDEX detalle_pedido_combo_id_5bbe2a92 ON public.detalle_pedido USING btree (combo_id);
 4   DROP INDEX public.detalle_pedido_combo_id_5bbe2a92;
       public            maddie    false    269            )           1259    17996 #   detalle_pedido_giftcard_id_f923ed08    INDEX     e   CREATE INDEX detalle_pedido_giftcard_id_f923ed08 ON public.detalle_pedido USING btree (giftcard_id);
 7   DROP INDEX public.detalle_pedido_giftcard_id_f923ed08;
       public            maddie    false    269            S           1259    24869 0   detalle_pedido_giftcards_detallegift_id_da6f5867    INDEX        CREATE INDEX detalle_pedido_giftcards_detallegift_id_da6f5867 ON public.detalle_pedido_giftcards USING btree (detallegift_id);
 D   DROP INDEX public.detalle_pedido_giftcards_detallegift_id_da6f5867;
       public            maddie    false    291            T           1259    24870 +   detalle_pedido_giftcards_pedido_id_a7209649    INDEX     u   CREATE INDEX detalle_pedido_giftcards_pedido_id_a7209649 ON public.detalle_pedido_giftcards USING btree (pedido_id);
 ?   DROP INDEX public.detalle_pedido_giftcards_pedido_id_a7209649;
       public            maddie    false    291            *           1259    17997 !   detalle_pedido_pedido_id_75d4855e    INDEX     a   CREATE INDEX detalle_pedido_pedido_id_75d4855e ON public.detalle_pedido USING btree (pedido_id);
 5   DROP INDEX public.detalle_pedido_pedido_id_75d4855e;
       public            maddie    false    269            -           1259    17998 #   detalle_pedido_producto_id_bc3adbcb    INDEX     e   CREATE INDEX detalle_pedido_producto_id_bc3adbcb ON public.detalle_pedido USING btree (producto_id);
 7   DROP INDEX public.detalle_pedido_producto_id_bc3adbcb;
       public            maddie    false    269            �           1259    17603 $   direccion_usuario_ciudad_id_307e6280    INDEX     g   CREATE INDEX direccion_usuario_ciudad_id_307e6280 ON public.direccion_usuario USING btree (ciudad_id);
 8   DROP INDEX public.direccion_usuario_ciudad_id_307e6280;
       public            maddie    false    233            �           1259    17604 '   direccion_usuario_provincia_id_0517db6c    INDEX     m   CREATE INDEX direccion_usuario_provincia_id_0517db6c ON public.direccion_usuario USING btree (provincia_id);
 ;   DROP INDEX public.direccion_usuario_provincia_id_0517db6c;
       public            maddie    false    233            �           1259    17605 %   direccion_usuario_usuario_id_92bc3e3b    INDEX     i   CREATE INDEX direccion_usuario_usuario_id_92bc3e3b ON public.direccion_usuario USING btree (usuario_id);
 9   DROP INDEX public.direccion_usuario_usuario_id_92bc3e3b;
       public            maddie    false    233            �           1259    17442 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            maddie    false    217            �           1259    17443 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            maddie    false    217            :           1259    18058 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            maddie    false    276            =           1259    18057 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            maddie    false    276            
           1259    17882    envio_ciudad_id_9e080192    INDEX     O   CREATE INDEX envio_ciudad_id_9e080192 ON public.envio USING btree (ciudad_id);
 ,   DROP INDEX public.envio_ciudad_id_9e080192;
       public            maddie    false    259                       1259    24791 &   envio_codigo_seguimiento_a24c6544_like    INDEX     z   CREATE INDEX envio_codigo_seguimiento_a24c6544_like ON public.envio USING btree (codigo_seguimiento varchar_pattern_ops);
 :   DROP INDEX public.envio_codigo_seguimiento_a24c6544_like;
       public            maddie    false    259                       1259    17883    envio_provincia_id_4716f914    INDEX     U   CREATE INDEX envio_provincia_id_4716f914 ON public.envio USING btree (provincia_id);
 /   DROP INDEX public.envio_provincia_id_4716f914;
       public            maddie    false    259                       1259    17884    envio_transporte_id_83505022    INDEX     W   CREATE INDEX envio_transporte_id_83505022 ON public.envio USING btree (transporte_id);
 0   DROP INDEX public.envio_transporte_id_83505022;
       public            maddie    false    259                       1259    17885    envio_usuario_id_bd388594    INDEX     Q   CREATE INDEX envio_usuario_id_bd388594 ON public.envio USING btree (usuario_id);
 -   DROP INDEX public.envio_usuario_id_bd388594;
       public            maddie    false    259            �           1259    17808    gift_card_slug_57b023c8    INDEX     M   CREATE INDEX gift_card_slug_57b023c8 ON public.gift_card USING btree (slug);
 +   DROP INDEX public.gift_card_slug_57b023c8;
       public            maddie    false    253            �           1259    17809    gift_card_slug_57b023c8_like    INDEX     f   CREATE INDEX gift_card_slug_57b023c8_like ON public.gift_card USING btree (slug varchar_pattern_ops);
 0   DROP INDEX public.gift_card_slug_57b023c8_like;
       public            maddie    false    253            2           1259    18032 &   lovelist_producto_lovelist_id_54a2a78f    INDEX     k   CREATE INDEX lovelist_producto_lovelist_id_54a2a78f ON public.lovelist_producto USING btree (lovelist_id);
 :   DROP INDEX public.lovelist_producto_lovelist_id_54a2a78f;
       public            maddie    false    273            5           1259    18033 &   lovelist_producto_producto_id_d0a6c190    INDEX     k   CREATE INDEX lovelist_producto_producto_id_d0a6c190 ON public.lovelist_producto USING btree (producto_id);
 :   DROP INDEX public.lovelist_producto_producto_id_d0a6c190;
       public            maddie    false    273            �           1259    17713    marca_modelo_marca_id_499532e5    INDEX     [   CREATE INDEX marca_modelo_marca_id_499532e5 ON public.marca_modelo USING btree (marca_id);
 2   DROP INDEX public.marca_modelo_marca_id_499532e5;
       public            maddie    false    245            �           1259    17714    marca_modelo_modelo_id_af3d1be4    INDEX     ]   CREATE INDEX marca_modelo_modelo_id_af3d1be4 ON public.marca_modelo USING btree (modelo_id);
 3   DROP INDEX public.marca_modelo_modelo_id_af3d1be4;
       public            maddie    false    245            �           1259    17695    marca_nombre_fd44a505_like    INDEX     b   CREATE INDEX marca_nombre_fd44a505_like ON public.marca USING btree (nombre varchar_pattern_ops);
 .   DROP INDEX public.marca_nombre_fd44a505_like;
       public            maddie    false    241            �           1259    17702    modelo_marca_id_8f25fca6    INDEX     O   CREATE INDEX modelo_marca_id_8f25fca6 ON public.modelo USING btree (marca_id);
 ,   DROP INDEX public.modelo_marca_id_8f25fca6;
       public            maddie    false    243            �           1259    17701    modelo_nombre_1dcb5764_like    INDEX     d   CREATE INDEX modelo_nombre_1dcb5764_like ON public.modelo USING btree (nombre varchar_pattern_ops);
 /   DROP INDEX public.modelo_nombre_1dcb5764_like;
       public            maddie    false    243                        1259    17973    pedido_envio_id_e718ff92    INDEX     O   CREATE INDEX pedido_envio_id_e718ff92 ON public.pedido USING btree (envio_id);
 ,   DROP INDEX public.pedido_envio_id_e718ff92;
       public            maddie    false    267            '           1259    17974    pedido_usuario_id_64a44bd6    INDEX     S   CREATE INDEX pedido_usuario_id_64a44bd6 ON public.pedido USING btree (usuario_id);
 .   DROP INDEX public.pedido_usuario_id_64a44bd6;
       public            maddie    false    267            �           1259    17586 !   perfil_usuario_ciudad_id_5a7d3473    INDEX     a   CREATE INDEX perfil_usuario_ciudad_id_5a7d3473 ON public.perfil_usuario USING btree (ciudad_id);
 5   DROP INDEX public.perfil_usuario_ciudad_id_5a7d3473;
       public            maddie    false    231            �           1259    17587 $   perfil_usuario_provincia_id_9ab2466c    INDEX     g   CREATE INDEX perfil_usuario_provincia_id_9ab2466c ON public.perfil_usuario USING btree (provincia_id);
 8   DROP INDEX public.perfil_usuario_provincia_id_9ab2466c;
       public            maddie    false    231            �           1259    17756    producto_calidad_id_6cda0364    INDEX     W   CREATE INDEX producto_calidad_id_6cda0364 ON public.producto USING btree (calidad_id);
 0   DROP INDEX public.producto_calidad_id_6cda0364;
       public            maddie    false    247            �           1259    17757    producto_categoria_id_67131168    INDEX     [   CREATE INDEX producto_categoria_id_67131168 ON public.producto USING btree (categoria_id);
 2   DROP INDEX public.producto_categoria_id_67131168;
       public            maddie    false    247            �           1259    17758    producto_marca_id_2793ee53    INDEX     S   CREATE INDEX producto_marca_id_2793ee53 ON public.producto USING btree (marca_id);
 .   DROP INDEX public.producto_marca_id_2793ee53;
       public            maddie    false    247            �           1259    17759    producto_modelo_id_aa4ef980    INDEX     U   CREATE INDEX producto_modelo_id_aa4ef980 ON public.producto USING btree (modelo_id);
 /   DROP INDEX public.producto_modelo_id_aa4ef980;
       public            maddie    false    247            �           1259    17770 '   producto_proveedor_producto_id_95bc7969    INDEX     m   CREATE INDEX producto_proveedor_producto_id_95bc7969 ON public.producto_proveedor USING btree (producto_id);
 ;   DROP INDEX public.producto_proveedor_producto_id_95bc7969;
       public            maddie    false    249            �           1259    17771 (   producto_proveedor_proveedor_id_7996bc74    INDEX     o   CREATE INDEX producto_proveedor_proveedor_id_7996bc74 ON public.producto_proveedor USING btree (proveedor_id);
 <   DROP INDEX public.producto_proveedor_proveedor_id_7996bc74;
       public            maddie    false    249            �           1259    17754    producto_slug_6d26ea98    INDEX     K   CREATE INDEX producto_slug_6d26ea98 ON public.producto USING btree (slug);
 *   DROP INDEX public.producto_slug_6d26ea98;
       public            maddie    false    247            �           1259    17755    producto_slug_6d26ea98_like    INDEX     d   CREATE INDEX producto_slug_6d26ea98_like ON public.producto USING btree (slug varchar_pattern_ops);
 /   DROP INDEX public.producto_slug_6d26ea98_like;
       public            maddie    false    247            �           1259    17643    proveedor_ciudad_id_3fada07e    INDEX     W   CREATE INDEX proveedor_ciudad_id_3fada07e ON public.proveedor USING btree (ciudad_id);
 0   DROP INDEX public.proveedor_ciudad_id_3fada07e;
       public            maddie    false    235            �           1259    17644    proveedor_provincia_id_6a6c922c    INDEX     ]   CREATE INDEX proveedor_provincia_id_6a6c922c ON public.proveedor USING btree (provincia_id);
 3   DROP INDEX public.proveedor_provincia_id_6a6c922c;
       public            maddie    false    235            �           1259    17642 #   proveedor_razonsocial_7e6cb24d_like    INDEX     t   CREATE INDEX proveedor_razonsocial_7e6cb24d_like ON public.proveedor USING btree (razonsocial varchar_pattern_ops);
 7   DROP INDEX public.proveedor_razonsocial_7e6cb24d_like;
       public            maddie    false    235            �           1259    17502    provincia_nombre_62714aa8_like    INDEX     j   CREATE INDEX provincia_nombre_62714aa8_like ON public.provincia USING btree (nombre varchar_pattern_ops);
 2   DROP INDEX public.provincia_nombre_62714aa8_like;
       public            maddie    false    223            F           1259    18113 .   recomendados_recomendados_producto_id_7eb66f2a    INDEX     n   CREATE INDEX recomendados_recomendados_producto_id_7eb66f2a ON public.recomendados USING btree (producto_id);
 B   DROP INDEX public.recomendados_recomendados_producto_id_7eb66f2a;
       public            maddie    false    281            C           1259    18136 "   test_producto_producto_id_12cae8eb    INDEX     c   CREATE INDEX test_producto_producto_id_12cae8eb ON public.test_producto USING btree (producto_id);
 6   DROP INDEX public.test_producto_producto_id_12cae8eb;
       public            maddie    false    279            >           1259    18067 #   thumbnail_kvstore_key_3f850178_like    INDEX     t   CREATE INDEX thumbnail_kvstore_key_3f850178_like ON public.thumbnail_kvstore USING btree (key varchar_pattern_ops);
 7   DROP INDEX public.thumbnail_kvstore_key_3f850178_like;
       public            maddie    false    277            K           1259    24673    token_pedido_id_c5cf7ab3    INDEX     O   CREATE INDEX token_pedido_id_c5cf7ab3 ON public.token USING btree (pedido_id);
 ,   DROP INDEX public.token_pedido_id_c5cf7ab3;
       public            maddie    false    287            N           1259    24674    token_usuario_id_ce053182    INDEX     Q   CREATE INDEX token_usuario_id_ce053182 ON public.token USING btree (usuario_id);
 -   DROP INDEX public.token_usuario_id_ce053182;
       public            maddie    false    287                        1259    17859    transporte_ciudad_id_459ce695    INDEX     Y   CREATE INDEX transporte_ciudad_id_459ce695 ON public.transporte USING btree (ciudad_id);
 1   DROP INDEX public.transporte_ciudad_id_459ce695;
       public            maddie    false    257                       1259    17858 "   transporte_direccion_cf6a5600_like    INDEX     r   CREATE INDEX transporte_direccion_cf6a5600_like ON public.transporte USING btree (direccion varchar_pattern_ops);
 6   DROP INDEX public.transporte_direccion_cf6a5600_like;
       public            maddie    false    257                       1259    17857    transporte_nombre_4b29fd64_like    INDEX     l   CREATE INDEX transporte_nombre_4b29fd64_like ON public.transporte USING btree (nombre varchar_pattern_ops);
 3   DROP INDEX public.transporte_nombre_4b29fd64_like;
       public            maddie    false    257            	           1259    17860     transporte_provincia_id_e513732a    INDEX     _   CREATE INDEX transporte_provincia_id_e513732a ON public.transporte USING btree (provincia_id);
 4   DROP INDEX public.transporte_provincia_id_e513732a;
       public            maddie    false    257            Y           2606    17384 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          maddie    false    3202    205    209            X           2606    17379 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          maddie    false    3207    209    207            W           2606    17370 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          maddie    false    203    3197    205            [           2606    17399 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          maddie    false    207    3207    213            Z           2606    17394 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          maddie    false    213    211    3218            ]           2606    17413 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          maddie    false    205    3202    215            \           2606    17408 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          maddie    false    211    215    3218            a           2606    18094 5   ciudad ciudad_cpostal_id_a10de275_fk_codigo_postal_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_cpostal_id_a10de275_fk_codigo_postal_id FOREIGN KEY (cpostal_id) REFERENCES public.codigo_postal(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_cpostal_id_a10de275_fk_codigo_postal_id;
       public          maddie    false    3244    225    221            `           2606    17508 3   ciudad ciudad_provincia_id_3dbe031c_fk_provincia_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_provincia_id_3dbe031c_fk_provincia_id FOREIGN KEY (provincia_id) REFERENCES public.provincia(id) DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_provincia_id_3dbe031c_fk_provincia_id;
       public          maddie    false    225    3249    223            }           2606    17908 ;   combo_producto combo_producto_combo_id_dbdf3adb_fk_combo_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.combo_producto
    ADD CONSTRAINT combo_producto_combo_id_dbdf3adb_fk_combo_id FOREIGN KEY (combo_id) REFERENCES public.combo(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.combo_producto DROP CONSTRAINT combo_producto_combo_id_dbdf3adb_fk_combo_id;
       public          maddie    false    3351    263    261            ~           2606    24771 A   combo_producto combo_producto_producto_id_44622e1b_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.combo_producto
    ADD CONSTRAINT combo_producto_producto_id_44622e1b_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.combo_producto DROP CONSTRAINT combo_producto_producto_id_44622e1b_fk_producto_id;
       public          maddie    false    247    3308    263            b           2606    18114 E   consulta_usuario consulta_usuario_usuario_id_c7529bed_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.consulta_usuario
    ADD CONSTRAINT consulta_usuario_usuario_id_c7529bed_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.consulta_usuario DROP CONSTRAINT consulta_usuario_usuario_id_c7529bed_fk_auth_user_id;
       public          maddie    false    3218    227    211            �           2606    24698 L   detalle_codigodescuento detalle_codigodescue_codigo_id_9994810c_fk_codigo_de    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_codigodescuento
    ADD CONSTRAINT detalle_codigodescue_codigo_id_9994810c_fk_codigo_de FOREIGN KEY (codigo_id) REFERENCES public.codigo_descuento(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.detalle_codigodescuento DROP CONSTRAINT detalle_codigodescue_codigo_id_9994810c_fk_codigo_de;
       public          maddie    false    3319    251    289            �           2606    24683 M   detalle_codigodescuento detalle_codigodescue_usuario_id_158c87f2_fk_perfil_us    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_codigodescuento
    ADD CONSTRAINT detalle_codigodescue_usuario_id_158c87f2_fk_perfil_us FOREIGN KEY (usuario_id) REFERENCES public.perfil_usuario(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.detalle_codigodescuento DROP CONSTRAINT detalle_codigodescue_usuario_id_158c87f2_fk_perfil_us;
       public          maddie    false    231    289    3265            u           2606    17810 F   detalle_giftcard detalle_giftcard_giftcard_id_fbb4dd59_fk_gift_card_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_giftcard
    ADD CONSTRAINT detalle_giftcard_giftcard_id_fbb4dd59_fk_gift_card_id FOREIGN KEY (giftcard_id) REFERENCES public.gift_card(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.detalle_giftcard DROP CONSTRAINT detalle_giftcard_giftcard_id_fbb4dd59_fk_gift_card_id;
       public          maddie    false    3321    255    253            v           2606    24845 J   detalle_giftcard detalle_giftcard_usuario_id_017f6d99_fk_perfil_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_giftcard
    ADD CONSTRAINT detalle_giftcard_usuario_id_017f6d99_fk_perfil_usuario_id FOREIGN KEY (usuario_id) REFERENCES public.perfil_usuario(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.detalle_giftcard DROP CONSTRAINT detalle_giftcard_usuario_id_017f6d99_fk_perfil_usuario_id;
       public          maddie    false    255    3265    231            �           2606    17975 ;   detalle_pedido detalle_pedido_combo_id_5bbe2a92_fk_combo_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_combo_id_5bbe2a92_fk_combo_id FOREIGN KEY (combo_id) REFERENCES public.combo(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.detalle_pedido DROP CONSTRAINT detalle_pedido_combo_id_5bbe2a92_fk_combo_id;
       public          maddie    false    269    3351    261            �           2606    24859 R   detalle_pedido_giftcards detalle_pedido_giftc_detallegift_id_da6f5867_fk_detalle_g    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_pedido_giftcards
    ADD CONSTRAINT detalle_pedido_giftc_detallegift_id_da6f5867_fk_detalle_g FOREIGN KEY (detallegift_id) REFERENCES public.detalle_giftcard(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.detalle_pedido_giftcards DROP CONSTRAINT detalle_pedido_giftc_detallegift_id_da6f5867_fk_detalle_g;
       public          maddie    false    291    3326    255            �           2606    17980 B   detalle_pedido detalle_pedido_giftcard_id_f923ed08_fk_gift_card_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_giftcard_id_f923ed08_fk_gift_card_id FOREIGN KEY (giftcard_id) REFERENCES public.gift_card(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.detalle_pedido DROP CONSTRAINT detalle_pedido_giftcard_id_f923ed08_fk_gift_card_id;
       public          maddie    false    253    269    3321            �           2606    24864 Q   detalle_pedido_giftcards detalle_pedido_giftcards_pedido_id_a7209649_fk_pedido_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_pedido_giftcards
    ADD CONSTRAINT detalle_pedido_giftcards_pedido_id_a7209649_fk_pedido_id FOREIGN KEY (pedido_id) REFERENCES public.pedido(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.detalle_pedido_giftcards DROP CONSTRAINT detalle_pedido_giftcards_pedido_id_a7209649_fk_pedido_id;
       public          maddie    false    267    291    3366            �           2606    17985 =   detalle_pedido detalle_pedido_pedido_id_75d4855e_fk_pedido_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_pedido_id_75d4855e_fk_pedido_id FOREIGN KEY (pedido_id) REFERENCES public.pedido(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.detalle_pedido DROP CONSTRAINT detalle_pedido_pedido_id_75d4855e_fk_pedido_id;
       public          maddie    false    3366    269    267            �           2606    17990 A   detalle_pedido detalle_pedido_producto_id_bc3adbcb_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_producto_id_bc3adbcb_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.detalle_pedido DROP CONSTRAINT detalle_pedido_producto_id_bc3adbcb_fk_producto_id;
       public          maddie    false    269    3308    247            h           2606    24579 C   direccion_usuario direccion_usuario_ciudad_id_307e6280_fk_ciudad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.direccion_usuario
    ADD CONSTRAINT direccion_usuario_ciudad_id_307e6280_fk_ciudad_id FOREIGN KEY (ciudad_id) REFERENCES public.ciudad(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.direccion_usuario DROP CONSTRAINT direccion_usuario_ciudad_id_307e6280_fk_ciudad_id;
       public          maddie    false    233    3252    225            i           2606    24584 I   direccion_usuario direccion_usuario_provincia_id_0517db6c_fk_provincia_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.direccion_usuario
    ADD CONSTRAINT direccion_usuario_provincia_id_0517db6c_fk_provincia_id FOREIGN KEY (provincia_id) REFERENCES public.provincia(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.direccion_usuario DROP CONSTRAINT direccion_usuario_provincia_id_0517db6c_fk_provincia_id;
       public          maddie    false    233    3249    223            g           2606    17598 L   direccion_usuario direccion_usuario_usuario_id_92bc3e3b_fk_perfil_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.direccion_usuario
    ADD CONSTRAINT direccion_usuario_usuario_id_92bc3e3b_fk_perfil_usuario_id FOREIGN KEY (usuario_id) REFERENCES public.perfil_usuario(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.direccion_usuario DROP CONSTRAINT direccion_usuario_usuario_id_92bc3e3b_fk_perfil_usuario_id;
       public          maddie    false    233    3265    231            ^           2606    17432 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          maddie    false    217    203    3197            _           2606    17437 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          maddie    false    3218    211    217            y           2606    17861 +   envio envio_ciudad_id_9e080192_fk_ciudad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.envio
    ADD CONSTRAINT envio_ciudad_id_9e080192_fk_ciudad_id FOREIGN KEY (ciudad_id) REFERENCES public.ciudad(id) DEFERRABLE INITIALLY DEFERRED;
 U   ALTER TABLE ONLY public.envio DROP CONSTRAINT envio_ciudad_id_9e080192_fk_ciudad_id;
       public          maddie    false    259    3252    225            z           2606    17866 1   envio envio_provincia_id_4716f914_fk_provincia_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.envio
    ADD CONSTRAINT envio_provincia_id_4716f914_fk_provincia_id FOREIGN KEY (provincia_id) REFERENCES public.provincia(id) DEFERRABLE INITIALLY DEFERRED;
 [   ALTER TABLE ONLY public.envio DROP CONSTRAINT envio_provincia_id_4716f914_fk_provincia_id;
       public          maddie    false    223    259    3249            {           2606    17871 3   envio envio_transporte_id_83505022_fk_transporte_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.envio
    ADD CONSTRAINT envio_transporte_id_83505022_fk_transporte_id FOREIGN KEY (transporte_id) REFERENCES public.transporte(id) DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public.envio DROP CONSTRAINT envio_transporte_id_83505022_fk_transporte_id;
       public          maddie    false    3336    259    257            |           2606    24626 /   envio envio_usuario_id_bd388594_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.envio
    ADD CONSTRAINT envio_usuario_id_bd388594_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 Y   ALTER TABLE ONLY public.envio DROP CONSTRAINT envio_usuario_id_bd388594_fk_auth_user_id;
       public          maddie    false    3218    259    211            �           2606    18022 G   lovelist_producto lovelist_producto_lovelist_id_54a2a78f_fk_lovelist_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.lovelist_producto
    ADD CONSTRAINT lovelist_producto_lovelist_id_54a2a78f_fk_lovelist_id FOREIGN KEY (lovelist_id) REFERENCES public.lovelist(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.lovelist_producto DROP CONSTRAINT lovelist_producto_lovelist_id_54a2a78f_fk_lovelist_id;
       public          maddie    false    271    3375    273            �           2606    18027 G   lovelist_producto lovelist_producto_producto_id_d0a6c190_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.lovelist_producto
    ADD CONSTRAINT lovelist_producto_producto_id_d0a6c190_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.lovelist_producto DROP CONSTRAINT lovelist_producto_producto_id_d0a6c190_fk_producto_id;
       public          maddie    false    247    273    3308            �           2606    18017 5   lovelist lovelist_usuario_id_752e3cd9_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.lovelist
    ADD CONSTRAINT lovelist_usuario_id_752e3cd9_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.lovelist DROP CONSTRAINT lovelist_usuario_id_752e3cd9_fk_auth_user_id;
       public          maddie    false    211    3218    271            m           2606    17703 7   marca_modelo marca_modelo_marca_id_499532e5_fk_marca_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.marca_modelo
    ADD CONSTRAINT marca_modelo_marca_id_499532e5_fk_marca_id FOREIGN KEY (marca_id) REFERENCES public.marca(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.marca_modelo DROP CONSTRAINT marca_modelo_marca_id_499532e5_fk_marca_id;
       public          maddie    false    241    3292    245            n           2606    17708 9   marca_modelo marca_modelo_modelo_id_af3d1be4_fk_modelo_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.marca_modelo
    ADD CONSTRAINT marca_modelo_modelo_id_af3d1be4_fk_modelo_id FOREIGN KEY (modelo_id) REFERENCES public.modelo(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.marca_modelo DROP CONSTRAINT marca_modelo_modelo_id_af3d1be4_fk_modelo_id;
       public          maddie    false    243    3298    245            l           2606    17696 +   modelo modelo_marca_id_8f25fca6_fk_marca_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_marca_id_8f25fca6_fk_marca_id FOREIGN KEY (marca_id) REFERENCES public.marca(id) DEFERRABLE INITIALLY DEFERRED;
 U   ALTER TABLE ONLY public.modelo DROP CONSTRAINT modelo_marca_id_8f25fca6_fk_marca_id;
       public          maddie    false    243    241    3292            �           2606    24720 7   pedido pedido_codigo_descuento_id_929bffa0_fk_detalle_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_codigo_descuento_id_929bffa0_fk_detalle_c FOREIGN KEY (codigo_descuento_id) REFERENCES public.detalle_codigodescuento(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_codigo_descuento_id_929bffa0_fk_detalle_c;
       public          maddie    false    289    3409    267            �           2606    24805 +   pedido pedido_envio_id_e718ff92_fk_envio_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_envio_id_e718ff92_fk_envio_id FOREIGN KEY (envio_id) REFERENCES public.envio(id) DEFERRABLE INITIALLY DEFERRED;
 U   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_envio_id_e718ff92_fk_envio_id;
       public          maddie    false    3343    267    259            �           2606    24727 C   pedido pedido_giftcard_descuento_id_2b515590_fk_detalle_giftcard_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_giftcard_descuento_id_2b515590_fk_detalle_giftcard_id FOREIGN KEY (giftcard_descuento_id) REFERENCES public.detalle_giftcard(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_giftcard_descuento_id_2b515590_fk_detalle_giftcard_id;
       public          maddie    false    3326    255    267            �           2606    24810 )   pedido pedido_pago_id_db80630e_fk_pago_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pago_id_db80630e_fk_pago_id FOREIGN KEY (pago_id) REFERENCES public.pago(id) DEFERRABLE INITIALLY DEFERRED;
 S   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pago_id_db80630e_fk_pago_id;
       public          maddie    false    265    3357    267                       2606    17967 1   pedido pedido_usuario_id_64a44bd6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_usuario_id_64a44bd6_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 [   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_usuario_id_64a44bd6_fk_auth_user_id;
       public          maddie    false    267    211    3218            d           2606    17571 =   perfil_usuario perfil_usuario_ciudad_id_5a7d3473_fk_ciudad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.perfil_usuario
    ADD CONSTRAINT perfil_usuario_ciudad_id_5a7d3473_fk_ciudad_id FOREIGN KEY (ciudad_id) REFERENCES public.ciudad(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.perfil_usuario DROP CONSTRAINT perfil_usuario_ciudad_id_5a7d3473_fk_ciudad_id;
       public          maddie    false    231    3252    225            f           2606    18126 C   perfil_usuario perfil_usuario_provincia_id_9ab2466c_fk_provincia_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.perfil_usuario
    ADD CONSTRAINT perfil_usuario_provincia_id_9ab2466c_fk_provincia_id FOREIGN KEY (provincia_id) REFERENCES public.provincia(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.perfil_usuario DROP CONSTRAINT perfil_usuario_provincia_id_9ab2466c_fk_provincia_id;
       public          maddie    false    3249    223    231            e           2606    17581 A   perfil_usuario perfil_usuario_usuario_id_7abe8fbf_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.perfil_usuario
    ADD CONSTRAINT perfil_usuario_usuario_id_7abe8fbf_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.perfil_usuario DROP CONSTRAINT perfil_usuario_usuario_id_7abe8fbf_fk_auth_user_id;
       public          maddie    false    211    3218    231            �           2606    18044 R   preventconcurrentlogins_visitor preventconcurrentlog_user_id_d63979bc_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.preventconcurrentlogins_visitor
    ADD CONSTRAINT preventconcurrentlog_user_id_d63979bc_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.preventconcurrentlogins_visitor DROP CONSTRAINT preventconcurrentlog_user_id_d63979bc_fk_auth_user;
       public          maddie    false    3218    211    275            o           2606    17734 3   producto producto_calidad_id_6cda0364_fk_calidad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_calidad_id_6cda0364_fk_calidad_id FOREIGN KEY (calidad_id) REFERENCES public.calidad(id) DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_calidad_id_6cda0364_fk_calidad_id;
       public          maddie    false    247    3282    237            p           2606    17739 7   producto producto_categoria_id_67131168_fk_categoria_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_categoria_id_67131168_fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES public.categoria(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_categoria_id_67131168_fk_categoria_id;
       public          maddie    false    247    3287    239            q           2606    17744 /   producto producto_marca_id_2793ee53_fk_marca_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_marca_id_2793ee53_fk_marca_id FOREIGN KEY (marca_id) REFERENCES public.marca(id) DEFERRABLE INITIALLY DEFERRED;
 Y   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_marca_id_2793ee53_fk_marca_id;
       public          maddie    false    247    3292    241            r           2606    17749 1   producto producto_modelo_id_aa4ef980_fk_modelo_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_modelo_id_aa4ef980_fk_modelo_id FOREIGN KEY (modelo_id) REFERENCES public.modelo(id) DEFERRABLE INITIALLY DEFERRED;
 [   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_modelo_id_aa4ef980_fk_modelo_id;
       public          maddie    false    247    3298    243            s           2606    17760 I   producto_proveedor producto_proveedor_producto_id_95bc7969_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto_proveedor
    ADD CONSTRAINT producto_proveedor_producto_id_95bc7969_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.producto_proveedor DROP CONSTRAINT producto_proveedor_producto_id_95bc7969_fk_producto_id;
       public          maddie    false    247    249    3308            t           2606    17765 K   producto_proveedor producto_proveedor_proveedor_id_7996bc74_fk_proveedor_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto_proveedor
    ADD CONSTRAINT producto_proveedor_proveedor_id_7996bc74_fk_proveedor_id FOREIGN KEY (proveedor_id) REFERENCES public.proveedor(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.producto_proveedor DROP CONSTRAINT producto_proveedor_proveedor_id_7996bc74_fk_proveedor_id;
       public          maddie    false    3276    235    249            j           2606    17632 3   proveedor proveedor_ciudad_id_3fada07e_fk_ciudad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_ciudad_id_3fada07e_fk_ciudad_id FOREIGN KEY (ciudad_id) REFERENCES public.ciudad(id) DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT proveedor_ciudad_id_3fada07e_fk_ciudad_id;
       public          maddie    false    235    3252    225            k           2606    17637 9   proveedor proveedor_provincia_id_6a6c922c_fk_provincia_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_provincia_id_6a6c922c_fk_provincia_id FOREIGN KEY (provincia_id) REFERENCES public.provincia(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT proveedor_provincia_id_6a6c922c_fk_provincia_id;
       public          maddie    false    235    223    3249            �           2606    18108 J   recomendados recomendados_recomendados_producto_id_7eb66f2a_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.recomendados
    ADD CONSTRAINT recomendados_recomendados_producto_id_7eb66f2a_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.recomendados DROP CONSTRAINT recomendados_recomendados_producto_id_7eb66f2a_fk_producto_id;
       public          maddie    false    247    281    3308            c           2606    17566 O   respuesta_usuario respuesta_usuario_consulta_id_b1927292_fk_consulta_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.respuesta_usuario
    ADD CONSTRAINT respuesta_usuario_consulta_id_b1927292_fk_consulta_usuario_id FOREIGN KEY (consulta_id) REFERENCES public.consulta_usuario(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.respuesta_usuario DROP CONSTRAINT respuesta_usuario_consulta_id_b1927292_fk_consulta_usuario_id;
       public          maddie    false    227    3255    229            �           2606    18131 ?   test_producto test_producto_producto_id_12cae8eb_fk_producto_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.test_producto
    ADD CONSTRAINT test_producto_producto_id_12cae8eb_fk_producto_id FOREIGN KEY (producto_id) REFERENCES public.producto(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.test_producto DROP CONSTRAINT test_producto_producto_id_12cae8eb_fk_producto_id;
       public          maddie    false    247    3308    279            �           2606    24733 +   token token_pedido_id_c5cf7ab3_fk_pedido_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_pedido_id_c5cf7ab3_fk_pedido_id FOREIGN KEY (pedido_id) REFERENCES public.pedido(id) DEFERRABLE INITIALLY DEFERRED;
 U   ALTER TABLE ONLY public.token DROP CONSTRAINT token_pedido_id_c5cf7ab3_fk_pedido_id;
       public          maddie    false    267    3366    287            �           2606    24668 /   token token_usuario_id_ce053182_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_usuario_id_ce053182_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 Y   ALTER TABLE ONLY public.token DROP CONSTRAINT token_usuario_id_ce053182_fk_auth_user_id;
       public          maddie    false    211    287    3218            w           2606    17847 5   transporte transporte_ciudad_id_459ce695_fk_ciudad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.transporte
    ADD CONSTRAINT transporte_ciudad_id_459ce695_fk_ciudad_id FOREIGN KEY (ciudad_id) REFERENCES public.ciudad(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.transporte DROP CONSTRAINT transporte_ciudad_id_459ce695_fk_ciudad_id;
       public          maddie    false    3252    257    225            x           2606    17852 ;   transporte transporte_provincia_id_e513732a_fk_provincia_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.transporte
    ADD CONSTRAINT transporte_provincia_id_e513732a_fk_provincia_id FOREIGN KEY (provincia_id) REFERENCES public.provincia(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.transporte DROP CONSTRAINT transporte_provincia_id_e513732a_fk_provincia_id;
       public          maddie    false    257    3249    223            )     x��P�n� <���q��1G�-�^+U(~�<p��/�'��
�b�r/����;Tp�m��h/������{r�_>��H�D�ݣ����:�t�&�=����U�w?��U����6L˵‌��(�%Y�g�3���{.b�u�bF�6T�L�넒�0�b�قG����/p @%��!hç� ���n3�l�0Ɖ����c�}�O��*��gư�R��q���.�&���2��)^���\��\�9�R�]��Y�� �"{�            x������ � �            x������ � �         �  x���͎�6���S�	
K�ﲝ�$@PdY�P%�bK�$��Ce�G�+E�_�g7�CI<�ʜ"{���n���{�Y�������M�ǚ/u�4��<�ړ���@�=q��4��膮~�����{Vz����4!)0B�Nz� �!pϖ$�mt g;��i�>��5>a��t�H�'�B:T0X�p�.�mJ�"��q�^��7��6�Z��q��F�B�e/x0�#�Ɏ��X�4�^^F��8ȫ �@��kð�t,�����������Ͷ��ZΘR��C�W+;�����:�hoW���'^���#S�5��$L�x��ab�3�]«��M�<���;�#S�u�8"L�p��abm3�«��-��)����7d*����S�[p`�8���]�+�c}2_�ߦRK��
xB�u$0����C��(�����Z7\@AZ��Z�qF�J�l��J�gf���W�;;ק�]��/ �*ކ��u�V��H�VzZ�#�X�i���H�ix��z�k/�N�z윪�����F�㑄��TV��ԀJD�(8I��r��S\�Υ*4��Q�zS7&�*qoj���V��M��I�ɴ����.������f��q�:�┎���me�S*l�RÉ׍�i���zք6׆����٪��`¤LՄ��%e�H�E!]R�U�>um�fEh~M84[U$�BN��ad�%@P!$Ȉ�׳=��:+�`̟�j��AW$�#X�[�d�`k��O9��qH�����Tj	 o��t��)$�;�qNۇ�)������Ne�4�JSh%P{�f� 8%�Nݱ�G�Moso6���AV�B���3�|�8�Jγ	�C�	D����������-���<ge	����T�$C��c*K���1%	A��'�}�
s;,U�2����)Tr�NYY�Y��A��'����3���L�y&П���
���}?�ܯ�0SV��7��.��A�8F�/�*�1M�~�َY�	����w��r�w�����V���E)�j���Y�tkB�u��X��eg�����tƁz#D��"q�+�p����"Qp�(�(������ý��<m�;RqgL"���xCJ��o		��Gx�Yz&?d�C"9��bT�U��AŨ���7c�tx��u�4˃�x���#����J�&r͢ȶm�����]�N��	a��T+q�Ϋ�p��܇Q(:&�S���_���2�L��*��&:R��ƒN���=���x�{:�gb7��v}��YU���'���/���"���/���"��ϗPz��o��|�V�D��)�^3�8�ߧ��SDL~�"��o���Ssu_2CV���/Ct��֩�K����Mj5�jj�z{�6b-4�X�I\Z��\�#	���N4��Q*�
��WfU�۰��"E��X�8��#
�V�����#�ޤj��Gj�S#�"���r�F(9���4��U�C��|+��ދJ����B��{|,	O�B��E�v�#z8��E�}�T{ذ�s��Q1O�4J��@,��%!����e��k?��g�,q�Y�����"�:qJG7�F�8%��IUWN	�G2՛�u���Ԡ��3��H�}Dh�Ni���f�v���"x�5<|�}��.nX#�!H�"�� H~�"? �T�jB����r����j���R띤�S�v?��AmKϦ���l�d�K�%���L\!�7Gz����<P���d����JU�'S�6��T��<��~����c���yS      !   �  x�u��k�0����"~�g]|��\���U�;�#��Բ��_�����>4��:~|�������2�tCA��4M��U���޸�e��o���=�Ͼ�cO�������t]���^�48�/yF��!���s��U�e�.=`q)* @��X��|8�鷴d�P_�R��!���h��i!Ӑ!��0��8�W??"�9�1ލuD�w����rs篼�y.�{���ΞB��gj]1[sh9��`�bu�Y�r@e)��8�sʆ�1+Y+:5.��
p���:q�9��9|h�u4�7K=)��ٓ�������|]�P皣�m�����s_����i�O�Uôْ�	�X6�<\.Iފ�/
Q���Ŋ�UÕCr��K��a�:�6&��ou6�����      #      x������ � �      %      x������ � �      ;   +   x�3�t�)I�tN��LILQHr��8}SS2�� W� W��      =   5   x�3�*M�/J-�L�2��IL�L�s�9�2sS�@lN��b�h	W� ��X      /      x�3���Wp/J�KI�4�4����� B��      I   �   x�U�A
�0����)
YW2i��Тd����΢66��o�`�����3�j�%>�6��Q���Y�M�N�a��k�kJ�����%�ܶ�$��㜀��M2H�*�������;��&H&qCX��lu:�wv�Gx�I��4^V���@�      +      x�3�412�2R�\1z\\\ �      S     x�m�Mj�0���)t�#�r�mIɢr�Bي�Ķ����P=E/V�P��0��7��'�Aw�ic:����i��Wl�!�H�|
ҍ"�$���������Dzۄ��������{t���@$l U�$�z@�"R+X�|����]'�s���ߋ&���_��շ����?�U�x��R�����U��V� k�K&��n~{���}��w��j$L�)-�?Y;���6���=F���\F��ءeh=;��Xݡ7��k������K.oi�$?f ��      U   E   x�ML��0��a|���]��AN�J�b7o<f}f1/x�8%�׿>����r*JG�YO��(      1   �   x�e���0�����&1 �R���ֈ���O�80�b$�B�l�Y�{v
y�z\Ue��R�w�;��*	���>��l��Z�	o���$�V�5�X�(��(�_��5ZΐzK������)!�st��a��	X��lb�nF��C<��Xu1#K8��#��%��P���Wpd�9c���Q      o   z   x�34�4202�50�54�4r8-�L��,M-��(��_�ꛘ�ZZ�T�b�bdfj�gl`�i���C��1X��p-�Z�-M�M�Z +4����� ���3�'�?�5�+F��� �/�      M   �   x���Mj�0��������j$�Z�7�F�n1�	���+l
)��N�<|��7��a��i?�P�z��°�������i�����)�c�02��=َ� ��D)Y�ҙ<f��(��_�ӎ�H.�!b��V[��T����U[c1
�MW;����D�B��e�����eDj/��q\�|:���[I�N�����{[����To� ��ph	�V´eN~����e�
��l��o��ٖ��      [   n  x���MN�0F��)z�Z���؇��@+TT��q�:��"�ȶ��i�|����y9���_��=��51%Q',�~<���B .�n#����cD�8���z���_��ϗ�_����e��d��!�$A�fF\!h���6�#H���"��6���i�����a���6Y��~�\�s1�!��A��S	�v�6!8&��f��O96Rn2J_�ח*fz\Ԭ$���+�&�.`PO�Rh(iGi�(J���)�����S��(m�%�!>_�=�ꃶ��䵗&�I�iP�:��N���[� 8$� �t��u!t�v�iLě�T.�~����Ƭ�J��3ee��#��e-���2�8�?��      q   4   x���  �w;�'bAwq�9��+9̂ڕ� U.
ؚL(;:�7H~��      7   �   x�m�=
�@��z�s�g�?Z�� �`e���N�!�C)���#����=p�s�mQ)Y���2�1x��A���/��5�qz��C�����6{����&��C�s{6L�8�I��Ǚ{m����/	      '      x��}ߎ��q���)�c��ɪ⟹"Y�9��������;�R˳ӛ�%q����0p�<@ ��RE��f�G����ds�^X��WŏU$�I��gm��.����2��"�������//W���˗�����/�GNC����:�\�}�Й�2�hKc���8��Q���eR��7W���J�I����c{�j�[����^�Ӆ�eL�
��V��u�ܙCK�b,����z�fs;"� ���Aa�������V��W����������f{ݡ("�(i�����z��/$��m�\�ެ�z2a%�������.��~�w��n�Z\��_ޭ��I�9)��K��ID��ⷻ��eo���VP�[���I�����~��zz2*V+�PHKgYV�}G�W�����^�]󿼔a]�/����Z�ܾ�q�����˻׷�w�_/��-~i?y��&zh�4 '�(R2ʈ�,7��׫?�����I��� �j�CH��W�W,��zJ0	)
�'_{�e�oY��w����ޠgU�zz �w-����g�$Y=3�"�-ݘF�v��zޑ'��k%u<��¸��n�1!'{�����ڗ7������߿���������,�4�sY�����E��}�z��o�7��׫�m��v��(Z���.w�����X��	�'�]�p����"����j�?�	�L"k�ғ5���^���*��`m^���oJۼQR���ݤ���^5���2%(RD�g�!�9�g�$Ƭd$<���
�֖��ji��l�i��͛ۼ|����:��Z��r��/��I�Ն�|Yu�����݊�������:f��?���<����f���Ū�c0���b���������� &E�7'~\�f���+^F��3�k�JC3;A�Ad�q���wb}��\��<�m���{����c�JfM��]߼��)\F�����n��l��x�6���m��%V�etƺYgy��@�Vceo�@������,e��Q[�����Qg�-[^Gئ0½#{6��͇����7�e�ŕLf�=����6W���e+��V������a�"�v��W��w�Vk�2��>�S;#�����\�>m�DͅwA�P4mgO�#)N�%�T<F��t4�7a6y� ;%;[� �A�W�%y�_E�����x�z�6��A���(�5�\��������V�n�{���R���y=G�yug��|~��]3��Վw����������	�m?��m�����C����e��,n�L�w��L��G���^�e#�ټ�6cFaΈ���Z����o��������ֹ�L��N��ݎ��b��]/V�w�1G����y���E*~N��/cEy��_�7o�V�۟���N>U�q��y����w��n�3i�IL���*?}��aYG_��_����
�!}2���؁��|�6ߡ���n�U ��[��D��{h�)5?�ϼj�c������h~鏛�%���O�3������]9W���RX��o� �>V}6ǫ\@��ˀ�X�_�d���b�9���?�m��V?��E(q�2&�9�d�x�|U�!��y�Z��zuw��C��B��`�B�[k�&z(��W?ܭ�s)+(EH���X�� I0^��E�OF��٫�h����{�
�C�0���߾�Ft�����r�B���>�j��z�b�������RHQ���'��R�����MrU�Np��w�;Bs"�Kc�	U<� r��	yE��.Rx��:78�O��bh�����j�g��u��4ǘ㼆w|��c�@1x��c�R��������m5��l�ÓM&�2�ZG�'�_���i�'7�N�6�w�j�d�F��<�K'�W���U��f��j���;-��!ǋ�x�D��ؒͬ
c�vKdxr��YuҖ[�_,�l���|uy��M��O�EQ��d���m.J�!��v��O͖�H1`�'�&`=�1=Ō���`|��t��9�M�s��H�&��?z�/�`SG|s,�$�炭�N�="I��o�@�,��j�V���%�,kK4-G�^��@ph'�=�F;�v�9|m�nΑ}=�}���ퟘ4O��9S���&`�93�tp���"Ϛ�ߘG��_%F�o��y�`
�����a�+&���>)z�5
(@��{l�@i��(K������n�$��f�Zڋ�U����35�퓳����T���vd����3)��H�|�q�ks�z���g���#+5��Z�H�9r6���XI�
��`��M��9��J0�yLLk��H9i���%��oaͱ��X26�6C�J��4�g�'���q� ��R��0� � (�K�!k���!H#�Y6"���ig� b����Ɨ�j�К� ��_Zz�:S�;d�^CP2�ޑ��B�Z���'��j:P{����0�h����o��Ɉ�8�~�o��E���ʡ�/g��Z�섰!�L�]g��Z��$l17i&|�?fk<�qDC1�f·^CH�<�oq3�۠!��e�#z(�	�F�d-=�	�w̄o��x��T��n&��� C ��	��C�L�m	A��2-!:[}љ��z�(.W1�[��ĜI���g��H��τ�f���j�lTB1Ef�w�!�����L��+��IA�*Y���ݑ�m�D�wP=� ���_m]�w �4���<���#%�tႨ���4�9F���U�^�v���m�̹"�6A.��S���M��n��X4δ�y$	����Q��Q)nw����ǵ���W�+)_Q�n�[��ö+���6G ��ɖ�%%ނ���' �s��t!L��Ǐ?j����d�S� �#	��¯���W\��$�))+Ysm�!�ʿ6��r]���x�}�C���~�([���0I���ŀH�Ns¼
�ć�X��L��,gJ���{�o	�mΙ��̛���ll���3�M����Y�z�ݱ	ݍ�N�Nb𱙐��r�2pD�6p���j /E���ݸ��'��:�K�X�j[�fw���Ή��'�����X�=c{���J~o���I�_[����QO��7w����#y�ӑx�t�Y��/����>��3݋����$g�.!�AR�)��{j
voWS*T8NO����\"�G�����Q˶c�`��Sr���D�G� �8[�r�	7��5g��;8�r~��	P	���t'h �>Ը�C:�T�/јx��OƗ:���N���U��d/���/�A�����{[��������i�x@/��[Mq���(g
���4���2E_�����2%���N����'hO���$��kek:��+#���N+��+#Z֏)&q
�Z���U�i-}-d�ؗ�"��}�C;�s�i�}�Cg��������6]��־��>d�d)�i��sP+]�i��sD��7���~�}�S	���|?�>Ǜ��A�S�8�>'{[�����8�>W!�Ok_hH�;�Ok_h �<ho�-�(:��q��܋�r`�j���Ɓ��V�8pz�5vj��tZ�@!M�Ӌ`�!o��i5L5<����6bY��;5i��2�K'N/�i���E%/��I�%D��xZ	�@	�NE�A2�U�PWd<�"��*"�#y*�G�n4S	q��uљ�B����c���^83��|F(�	}��gfZ$���"�-���)�0���p�~��a�X#�qI��%�?�:rx�a�/򉵋EͶ~yW��bew�����������\)�v���������}Mb�tQ�xd�;,��5��F�S�&�R��u-�	Z[�3-|��Eݳ(!P��֎�ֳtԳ|��SM4�M��z�d�K�0��^4���uͪ�Q��&�L���)�k�k%��]s����P]ݵ i�H�_a�Y�}]��8h�]���ϡ5ZG5���~�:��!'���:�[{[o��i��A{7]�b�wh���ƞY��P���gG��u�B���{W�&(�C��
���֔I135�r�ѕ���mɺ�d    }r%$7�4�u���$���H7XW��F�F�n ��#=m\#_7�o [�5�ݡ�@�m��2��/��{E��0��/��-V�x#_�7D[�$�C��|C�5���wh?�/��5��wh?�/�O�݉�;��7�-��F�0�o���y���/�ɖX,84�|y�(dph�����P1�߾�@�<���4�Ł|c��04�Ł|��X�����P����M0����o?�o�ZҚ�o�| ��mY�y��/ě�-Y<�؈�Mі����@�)��0����M���)R��x�/^���n��о/����Ĥy��/�ś�rF��R_���b��c#^�7o�v���|�/�d�-&*85�|�I��ox���/��˭m�ͩ���K�ek��ʿC��t-�;~x����Hע��kI~���Z�E˹@/�C��t�7��>���~ ]L��&���~ ]��I~���Z�o�7�;�H�Sr�<ྑ�HWn�͝����@�l
��ϿC��xy�ǥQ~�����:�x�F�a ^^e�����醁t�������醁t�����Q~���1������t�@�`M5�����ܲ��x�F��#] �[O����.v��z&�8�kk��W�����P�k5�#��0T@!:r������H:#��YԈ��3�c�%KёvF,���kDG�1���A#w�;�Z�i r0Xs�Z�i sp8Ւ+�@�0]����@� ��(�@���xk����!b��@�<D�<����BD��U�
19��;%Yb r��%r0�#b�0]҈�ȑje?�Ȝ'y1�j�@�!M�Q��c@#2'��!Ԉ����BxҀ��	�]��5b r��~Ƞ�AY�A��D.�'�A!"'����
19�$��sP��Ƚ,? "gg�\=�Z��WF8��H�C=Y�Z�XF�b���{�҇
1��92���2 @�5B-�^ ,#d٭��B$��AZ�`XFX([i���a աP���B9�FZ⽈XF�����{1���Po���E�2"��q����2"B�4���{�1ADS��#-�^l,#����{��p������2��K��P���#B�P�y/D��;�k���d\�:�y/L����Z�@� �qq�6b rv�����{�����J{-�^�,X�cu9b �$�O��P��ȓ�D�-�^�,#|��AK�4ˀ����%��e[��w��E� ��W�AK�;�犅��{ѳ��z�B����2�\�1�y/��ai!NU�/n�ѝr�6;�&C;�(�Ջ��Ў`����5�v�!C�א��ы��[�Ў�dh�ŝ~�hJ��%Stk���@���Eop��8���z�=\/@�qP+�� 7P"�Z{"n{8P!"*��w��K��<^8P�N�� 7���}8��zr����x���x8�9�'7��[��~���E�2P�8y�]�@q��U�lv��V�7oֻ��i��񁊕���:P�)i"��S-e�t(P0�2�M�t�BA�_���t�Dr�8Ո�:P��Sjq(����l��� c�zrS�q(S��+��w���g/��e
��Cm�E"e���t�M�Q=�8Ԧ^l2C�VH����H$3%/GЁ2�+u0T�^�2C=����_fh�z��P��q�|wb�<N��d��X�`fAy���	=�L�*tQ3�Q��E�G�R5���A��f
�a��)����(ֻ�
�O��h�󨧆���y�S�z*���'�\`|���_*�*��%'�z��ԣ���(�(�O��}^3�/���i}�?�L�dp~�J�Sട>�`߂C�l�o+(ph�q �woE��-6i,��(�}���ZS�*��X�$��U����Q�p�^CE�D�z��^U�7?O����j�-�k?��(0�ܒ%�������L���D6�b�U܎VO/�z�IF89�zj�m6�����S���$��F��m�2�>T�/���+�,��Y�l鋱��;�c��2;�%�s4J�z>���S9${[L��X6���b{k.(-�c���ʱ�� U�FnV��\^m���,ls�]>��D)���l3m��R����;��A{6� �C{�goj0P����T���u�i�c,M쯅д���������^��_d�,jL�M
����_���i��cj��[�E۴�˗�يf�+6�|�P,yŘ��}���Qkpx���|�#_�|Z�YC�B����3}	���ED�H=C�דx#�� ���ǫ:���!���*ĎJd`�e��~�
���b��J
�ǫ;J�����c�іt���`?^��Q�����.p�?T#kԏs"v�G��
��H�*����AD[_��V#:���K�':���HF`��3��
RG92������Ȉ�K*�Ft�!#��V�׈�dD��Z���Җ��ё|FX_�ub҈����IZ�4�y�z�,i��@�jF#i��@��ׇK����<E*�7I��d�RM[$-sߑ���L���l��w�ai��Aߑ���!�n*��:*�a���Q���S0�A�Q���Z�^}G#2��� L�Q�5��A��э�T�\7:
"�`�1�����;������JD"t�$�(M��P�(���c�Q��
�w�yi	T.yp�bIR|ZM&0�:�B[�µ�Lp_��f�I�m�j3�C=^�~�����L�XO������µM�T�#���µ:Ux4�0�ձ*���֫	nm=J��U�WE�`lI�[��m�*jM��h�AC��m�*�t%�`�9�������Sg<V`W_��,g���q�b�O��^=͟�+&՞�}�%�ZS̢��Nic2�k��{\�تM�w�2��[���'��č�6YSk��x��ڳ?��9��>�"��c��z=s8� ��S?{���T�W4p�����ec4p��V�	țN���JZO' �"2�CI+,�%�࢝��jf7�T�ꓗNoδ����3�w%P���Mf�5!�TfDЈ��dD���SԈ���R��3E���Ɛ�s�s��LM��b��5���LG*
qz����
B���T
CH�Dj#�Պ�\���lqGx�����c=�����a7�C%�ꞵ�]��vLp:����f���dn|�T~;��<��b�������䊍�b�-}Zv�ٕ�FH^:~v~��Ɇn����f���B�y�i��9;�v 1�4��K����Kg��g��N/*�>"���Ʋ�>1;��`6h���G`�!�MN/
�=槪T6��m��YMF�`�F�٠J�i��%��/�{���",��&N�qj+o�3rz�L�X�4p�9s��kş�rz�FZ�V�
���N;g[�V�	ζ���o�3�h�Mp�9�µ�Lp��.W휹�µ"Mp4�R;g.��^U8MW�jе �Ԭ�CM��� �� a�u�hj9j��Z����%cp*�S�V렣u;�Ɩ92��&Ù��q
�e�B1���e(�b.ά�=g�F��5�5�0δ�@�4��tgV�bR���c�J�a%��g��6*0M*_r��T�l��� �}}��8��+R,%iбЇx�jcޱ8��+i�N����l�!���U�d��=-b�99@m-8�X�P�3�a�٨ߟ}Uoj��
D�A��=至�8�"���PL��tH��q
E�'����Sͪf�D~�#'�t����ȅ ���~h���(�早�c4=g�P~�I�=�-vK�T�"N$�}���<F�dI<\*�u����sR�d��
���]���N{6c<��:�)4�a�^�QITC�h�����͔Dm@kga�th� Z��8��Sx�6�5��2�~��,�/~�W�S8��4����0Ǥ>�M�8]C�1ǹ�3A����%O�D�Xv�$a�0Q�0�I�w�R�)]��R~���~��8��LG��r5CU�' �
  ,��0S�(O�'����gzٙ�l2��#77LG��}l��g|Jf�)��Y��ɝ��8�o�0���QI��0���,�mS���>���a>�t*�e@RRj⣭�{1��^$���[��%�`TJ�ǚ�~0%�L��3�������uK@�iz��W�(�	ms%w�F�t.Y=]�l��s����ϥ��͓���kN*!=�*)�k>������(S�<���{RIO
�y䜉�;듞b-:y>��r�պ$P�l�WW��Nz	O�˳cO������E�k��g��GI�<�_�� �@�����sM�NK��	S"��n���r,6�4����&�'��"��zo���#�g�'��i6�6����7�l�,V������jWu�0ד�����z���̧�F�R��}ДRx.-�F�g�Z�<<}�����ٷ�����g��s��uvڤ
�>��a��l,�?�l|� ��?�8Q+/��4c����瑹�s�k]�W,=���5)��d"ՇÞs���-e켛z�������PΛ���v�\u=�&��y�(G#���q����e"����s��4i��OO��}��E�&�]}���NfS����0F�h�`����;�,Ӫ���d��#�x�d�"-�C��Lw�O�08A��R��{���s�rϦ@�f����I;�5�s�!>��~p��D��"/��f���f��-�A�<��O�Q�K�)�`K�0����0zN�<�v�@K�C�E�C�i�D�,��;=�@�t.=J �&	Ϥ����J��?����g��,�e�zJӫ�gv2j�B����A��LsR��&����y�ӡ��Ҡz����+�&����K�C���5���ƴ4r�}��h���J���E�o�;�E�P��$3(�*^�&���慕]B\��U.��{�ʃW}���\%i��k-��xQ�I�h���T�s�8@�ܔL�?D "�)�*� <��6[K����ʩO~>��<�G;gƎ�\���p�����pyq&>��A3�������x�')�N5�vfx���̅\��@���R9������0/_!�u��?E}D���"�>��ͮ��9 �gO��z'O��B���d��r/��Ɂ~I�'ۅ&�ӡ�$�y��@%��g^=� H�ԙ��� ��`��69,���*�"�&ؚ����wwk^)�V�Ղ����n��le�.�]i���2��,m�BaD,!����속��e��}��+0��㝖��^	0�����B}�r�Ks��g"N�r���n����75���(��4w���(��|�G
Eg7b}�NڣNJl��y���<>m{o�Էe�}�!�z�3�ŞlΞ��3�=j�r�o�񡃿�u<�X��>@�q[h	�����6�B�k�^6J�������Z�.h�R���h��'��[�����Qq�䊔l!��Jk���ֲ?^���#�ގ��~Gˆ3R�bٓRM�}�����׫?��ޝ��k����z#G��Vz���'�J��}������Q��Ze��'V�䜂���	��� Ƴz����,N��Yqp K�䓱wV��Â�%����U>����B��ȇ0�a,��Ί�p����냍����ƿ�H�0i�Q���*��ƣ�LC���Y
�q���vNa���4�{�W�q�t{�_��H�$,�3�S�����~��V��l�Eto����gY�3%�M��z�gaJ�����C��SW������~6��z�NnBT���-�2�I{�]�;��g�"�Uޖ��V�];_J��s1NG�}��HB_�Nk��U棝�-7)�|�(yg��嚯G�2��#���P�,�&�?��m�I� ������3��3���hʋ&/�K�'�"��t�J���F�F�Ӥ��`|�,ŒW��]0>O)d'�82��y�Y�nus���e�n⽝�MrZ?�����^w��9�r���&V;��!iQ��n*�r��<�*cg	�"sN�[Q����s';���W�v5���H�t��~��}_FN3�[M��7}��}5��g�L"7��`�ut�k.C[�s ��n��\��=o�?�O~	mAH�@.l!
P��;�#��>�U!!'��h ��XlE��Xu�3[T���Q�%kd�H�LW�o���߈b޲kABz��y ^��gN��u$��Gn�f��nt��m�>b�*eV��'��P2n�4�_�ւ��5�V���-	��$g����6���N_�r����7�e���+�1<���̚r-P"y".�/>[ݬ{y����Ȧ,�)@#��?�Z_]m�{DR&��D� [���L���-E��=��.��PL�4U��Q�a��~wX�y���_-z&c~Z�0��Ի��'�𓗇��F�)�� ���v�ӛ�|W��B�"��hN���o�'���f���R���9�h�o7���7��ւ�sz��_s�J//��izQ.Ӓ%���聦���^����G�D�C�5Kx�$g�Z�����W�������N�s�*8�T�"�e�j��������{��$�a�e2Jj��?p^���d�Z���-�d-�E;w���v����N��2��� 5U'�[5z�^��?>���߮����:��e>�L\V7���|zz^ݮ���J��;���)� y�si�+���Z]ܝ����v�x�ٮy���Z�o7��۷�v�Ok�Dh�a��G�'>�n�         �  x�mSێ�0}�?fU���H�4qkB����ׯ�R���qb�ة�q��2�����'v��+[9��V��O�cꈙb�fF�K��)�	N�F�.���#o8+��4/\T�p� ��%%�$)I�@L9&�JM��C^},BuP֤$��M��V9A�'�0�q!�V$Yc���@.>������<R�%B��.&��y�ю��B��,�dlc���Ɠ3��+3����:������G�>B]�=��"G�n�������St�f!�Ѹ�>�Ə'�P_���Ia(��L�>�,�t~`��q�s8����*����z:�jCT�ܞ��L˃�7�K���Zoc��3Ѝj�eW�����e}\�� }Z��f��Yeٗ���q�8�"+%*cp�z��"�]�1��!�������ü��Yw?�/��Y�T����_ǳ��? ��v2         �	  x���kr۸�+����/�e�X�D;��EE�Ƴ�{ Pґ�#����8�}@�n?���4M���BPӟ��o�;)$�%�/E?�j�jM����~�]{�~=�yc�3&�P���ޟ�/��h%�9os�l��}��<h��a�፶*0��k������ؾ5�_C����XN�&X&��ԍ���{�'۸�n-�1��;�Swhއ�W�Xr��-���nh��q���#�o1a�������������1�$�@z�����|i>�K�r� j&��4����]��eڎ�I5CracL��G�A��bvHm4Ҟ޺����v���8\O�f8��~�lB%m?B2�X�[��1���я�;��Q���Ho@H�Rط���6$ÆtJؖ����B0�^<�m�1¥�mɜds=���_�K��}��R�$�-��ZWL�?��u��ڭ�B����Oj�����g缐Q�rK��D�B�-D�~���(��/����H�R=�m⡿����H�}BnUٛ���ej^����p>��J��С����[UA��~u�9�2���8�m<ɻ�K�G�OGֱs&��a�@��^K�iN'gV�Nަ���x�6YR)�ed�� D��>w�{�������n���?��bv2�Rwg��uGݽ���)F+�c�H��~����jToj�J�z�8�8_����z�N����ؙ�)	��ڏ���7!m������Ρ|�����%u�q����bg�Y�#N�qn3;��:����I~����I��7T�����{�$��c��i����s����(8�N�.h��]���w����d���:���� ��4����p
���G���#���	�����a���^o��!�)<�p�O�7����"�#����uڷ���2+X%�jf��|��^���Ѿ�_��77�J�53����q�
m)"���]��0\�8��KI�W����>P�(��u���b�x�ZP�i:��t�v�/��&��~7������<����b�ŋ���dN7�q���TZC��Q�G6��6rI���Z! N
@攬t5��D��Z��q�"�L�|���,G��	)�I�y���0�{bF��@h���FM�TZ�`���=�l%2���b�MŊu*mVK�[� ��_k]�E2�ڮ=B��J�%F�Z"�rFN����ad�����?I�gBU�U�>��.1����pͪ&��:�J�Xct���f]��-��1�Ƙ���06šÛD�k�]Q����]�,�U��Zc\���d[S���(��,^c|�A&3��%�kp+�>���\����T�9̓#N�
̪�ȸ���qF1�r6k9�-��^�ǩ7�%BB?@�dh��YK9��R�C5� ԕO�۬�L���"gU+B���x�v-e����0���� ��q�%&�r�]Ӯ�L\�����Be)\��|�Z̤W8����b���CϮ�L���*�a\�94/6^���E�}E���m�Z�6q
Y]�,��/{�LJ�B{HVҚ��ьlt�kkKHy,��- ����n4�B9�>wPSD�ƍ)��y���̓�Y��^�~���+g�MVˉ�=Cَ�	���>��Mx�ؽ�K��|�����8z@�$Z�a٩m�?:���f���r���M�01m�ŉa�
��X�N��,c��j1t��X^�6�A��p��@5��{�X:��N��3��G�2�ɫ/'��'�
f\�+�3K�.��f S= ��)v���u�u����q���!���x�[�̦�.�y$��O!������Ն�K�+$d�p�>U�M�4�X|3�t��tx�Q�S&U��L�
fmj�G��C�6���b2���++bϩ���6�E찐�$ؠ����P��å���a�+�f~�9A��8�`�q�.�_�c.u��B��y
�\�R�ޢ�����	��D�$�'�����Ry��w�`�}�e�"�ֶ����%�#LYb�H�\�0��_�R�J���K�#1H�
-�"GV�*ƥ����	�Rf	�	��A)����[,;a>Sq@D�VJ2�s4�kyg����C}���4�c�����)�>��d�B�Uz2�pwn3D���j-Qr
$2��2(�$x@*Kκ�|6�e�a��rOjVD�1������5Ǘ|��^��Cbm0�Xqc+qT�CU�1^�L��H,Ɍ`�����g-�,���C�"i�Q�E�(L�)Ze��j�V�5%�-;"g����q�k_R
��k�]Rbz����5���R��$'�a������D����e^o�W�t\n�ux�`�2�D���U"�ȏ#L�x{�¤J�~�B/d�^���l�O�r)LI+�&�����'��rN�L�u���@�D�R�oXeI���(�;ZTB��S�T%E�)����8�y�(���s������Pڠb�JU��7�c�?�8�|�ϲ�J���{�9�\�*N��U,��&���0���r���w��Ǐ��ﴧ      b   �  x�ݘGҫh��Ǖ��po4�
��{���vVgUz=�Hz��#lm�H�o�r�aD.8O��&�0���J��߼�W�T,�@�x�K:���8�V�vt)��dqי4jY7;��ԁ�{X<9)�D�!�+sm�r�t�U���g(?�����ʞ�'�\oRĤUH]�r['�l~����ؐO��Ȓq��E����Y��h�LE�d�n�C��������ե��i7��wh�
��z��
�Jѿ���S$&�4�)=\9�PC����iN�����V�Dۤܦqec,v.h�X<�p�0C �'=`���� � �?�$���)�=ad�jK�%��>'�>���y��~ђ�ebd!J>��ml��إ�`��c6
��)��,p�?��ݸ~ϒs�l-X�MV_���o.��$�_�Y�g^���H�a<�V���%PW��T�V�˦�鰩�7^�Z=�a�����%�E�(U�� �-�}m+q�ov���(�D�M�ƽ�g��L�̲��㾚�K��n��f��f�?P��!(��u�s�.{^��(���-Q~�X؝�_�*P�/�]��نO��㕇Z�7�b*��ܵ�ڑ:�@� �*��n� D������jo�ՅXǋX�y�p����O^2��R�i�y��lq�i}[�|��cwC�
P�(�<tД��h`�z��PO)N"߬�/2�s�k�K��J�5�A��.!���=��9�KCvIP����}�/�hC�
s�۩lv�]+�o~��0�@o��0�@q���ゟǊCI���%���5!W�P�_�^CW~�z��
��ը��`!��k�{Ѹ��
���
O��PTC	H��W��@�f�oY�X���Jڣ�,5"�h8�%A���km��(s�K˩�-��-�q��l&F�x~C������9��ˋ��{=Xz��ʕ<�y���k�u�x��SЖ��F��W�*����!4I�|���rI|�����A����5Q��骭��A�vT�>����=��><2=�BD墳#NzF"K���T4u��Xt\j{�or��Tow����4q�BZ���,6����Z�&�(٢TS�`)�a����$d��LKJ4����`O��e����F; BZ��}�ι�]l8 %nݰi=N|B����a�]�-�uha�E�J����Nr���[7ԟ � ����1�B��,�ڔ�e�F�єˎ�`yB�|���uwu��'�6Ҁ]�Y]����B�[~Q�Loϊ7���&R�	���:����֟�d��w�9�>�-O�3��O��{�yr���(̏�)�kC�K���q\��Z��K?K�g��i@ȹ������}���sJ����BI��@F6 ��ojԘB��dpO~����{B T��0���kvR��kGL��k��B=@�E�D�Pk��Z����)�qc�Zұ�f�j���']߆
�}Vm��D�ɓ�(R*K5F��5�উ�~�8���
[��01��#,�7�~D�y;��J��$�D����z�� q��#�8�^~�?ND6�xo�wp>z��X٢�n�9e�� �<o�Ԯ�T_n�.{B� ���s��fH���qm���%���<�fˈ������B����0��q����!H�y�����$(�+'c�m,����ċ:�F|ēb��cx�%��i��6���2c ���0
ˤ�Y���<U��棥E��L��;X�J<��N��T8@����e��c�pe:$�u³ϐ�+z~3����^e�#`�gꀟeA���mi$��]�Gyk�>�s@�$�p�(O���������<��=��r�}��(�|�'�CEP�7�un��*���B`�87�J��@6|H��/�zY���0<�[�������s��=,�Y��.���F��t��A�/Cp��6[�h�l%���e[�1n�u'��C��� ��}���+�-u�џ�绹f�}��:ʴҌ��;Y^c������>��2AakR��ҽ���6��Q�ꀄi�9�P�-�̭�2�t�s�0W!Βmb�`� Yd��5��A>r��N�{A͛�h�� t�˷��wxݓ}ک_�W_1O��_3x��מ�0���C������Jc�L�э�����ѭ�_�0!� E,rG������5th��|_g�P�&�o5N�����G��	��KA�3�vM�1s�-t�롌wR�:�]D�5cZ�0��ܼ�Z��|���4U�����|ܳP?p�D����䳫��Rm��ts C��:�K�]�R���,\zŪUS1/�m�Fy�ųcc�csA�g�e�t% ��jeV>�n�Fr�X|�t��[�P͹R�SXod�>l7�l�-�tK�
�7T!/I�1I��'4ҩ��G�F���r4+�c�v���4�D�%~���'`Į[��P �S�$���Ju��X�����9T[J�(��Q�Bi�fQ�������Fou	���.���CZ>P���4�)����g�Z�u%J����i�ݝ�:H�	��=�A@$��P�/y��2@x^��!Rh���G	�Wô��^�3�&�`�Q�lqL�j~~���=x�NN����@Hy���x�F�E���<���?�*��^�"�7/2�]d��T��J�A&�q�y��RŸkO�@��쑜�נc�yF���p�%/�1r��=r(@}���X���:�2��A(���0��S��Wv��y%�s~�j㓺�(v���t�a^x�4N\j6���V�(p�� �I�;�
�"��6�^C�D���J����������.\ʙ@'��Y	)�^�]\��}�x�Bcڀ|N��"���M�����@7E�?�D�]�6p�s���-࿯�;����P�`���ߞY7Z�3�fD�k�D(��cEM��8�w��,2�^d�]��f�;��M^���0z��8�]�y]#SYыh�A]L%�����P�g�C�N�.�e�%�}�e�v�`Q�"�7�,��aځ��ʢ)���aҿ����(����NG����W l6���
է$���!�X*�?q3���~��'��1��&��1Ǡb�E����v0C�GH�?�#���?���l@�z�b�6X���ˡ~�5�ז%���h�� !����0�ʴ<�g2�ū~[E�\W��ٕ/!�;#Y���'��U���x#�a��]{"�׀��[�Ip�{-B�sQ�4�%M�M�*���h���){��Z�f������,��$&kQA�[���C��u�����j�������rP/�A��\@s>�S��t]��/�!��9!�^G��%�[D��㈿�c����|�n~-lsX~�����vg5�̰��[-5*0�_'� Z-��;~ߏ#�#��E?��|����>�s�iU2� \��?&��;?�� 0�������?�	q�L�      Q   �   x����
�0�s�y���I:��qA�����C���CP�Ø����k�Hc3�UU��
�8��6�ՃcJaU^�hQ�0��@�^@��l��$3h�Y�ce��"&H����e���>v�<�i�O�)�.D��f��Sr���`R�sfU��$�4���z�
s�(��>���P�Z�C{��n�$In����      K   �   x�mOˊ�0<;_��^��nC�O��ia�j��n����ZB�A3#�v(e��@����j��xD��A���!���'����|�(� ��)��!�\$!R�Ԩ<+�=ճc]K�j�T�$X9�{���ښV۩��ý����Em�r���t�������^��P��
<s�h�gO�-�Y�~DG���f��TUu	l�      ]   '   x�3���T��/K��,.Qx4w	�!�1���W� k{�      _   !   x�3�4�4�2��\�@Ґ˂�Ȏ���� 5\�      ?   +   x�3�I,*I�2�tJ�KM�,�2��M�LJ��������� ��	�      C      x������ � �      A   Q   x�3�t�)-�PpJ,R����,IMQpM�,����4�2���OI��WHIU((*MMJ���2F�M�LJ���̃�s��qqq �u6      W   �  x����j�@���w�Z��T(}�>A hN���6�7���7�֡Y��0#�ү	�[_[]����$0�k�\�r��Z��.���m�?A�K]��i���������u)���$���i]��/�p�^O�9���ː�j�9]����K��y���\�cMp�ƌ�k���AX+0Y/\X��>���Cs�F��1z�|�5��
b�זA�P딉ĸZ�������˔���uk��_����h��19�� �`�cu �m�l�Š�}w��Z(w���rTc��s��g&����,��Yl2�*����ѱ7�d��r)��3���,xH��e�ԋ���/�Ͽ�c�a1��\�ZRVcAYjh�O��\ܤ�|D���m
nV�Ys=����U��      Y   a  x�}�]j�0�7��"�Oڕ��I]7�y��R�&-$�/{<Dg�<,/��|�N�	���[�'Ɩ�,�kŲEՌ�`?-��}z���3Wp�~�!*�\qq�_��Ƙ�Y�:�Њ%�o�ez?|�G(���
=�ޅR��TR)�<,�3�� x��,�g$��L����Q������-a��v�e|T��XcM�Bb�����0/��Ǘ��5*�c�R�bn4�*Rt.x9�O�Py����G|ݖk$p%I2��bF$U1��o���4��Eh4vˉ\.�����X����p୑F���ZQ~7�o��\g��K��	C��#�(��S�^����l��f˅      5   �   x�u��n� D��/X�c�/����Rt1U��/����4Ҽ7(��8Y8MP����Bʢx�C�=�YmPi���Nnk�p�W1��CH��s��R-��(����7�5��v6�˳|�gͩ�#l��=$�rW3��8���F��յ���ЩG>���.�A!��k���	�b?�ǶF����i�~��ʙ��"���@W�      i   �  x�uUKr�6]S��4�L�I%�qT��R�Xrɟ�7-��>���Ch��W��&U����~g�	��u�{�������j'�r�!O"�*i/j-U�ҝ�o(�,��z_����b��R���#�q^H�rC��+��mɊ����e_��U+��(�'�Yۊ�C�E�PW*�2n$n��{��)��� bH2�@f���
Bٍ&�(�Ie���o_Ih��'dm���W� �N0��D\bh�LU� ��W^mTI娨aD�z�ۜڭ�ND�%�0FUt�g�6O���1���d�i�8j�h�b�l�J�!ﯢD%A<�ە6��T�����rQ�m���ĳ0N��@ȵ�����g9��-�z�7w������[9? ���Oj��\�Ftn�}MR��,�5��HLAC/����9t�^�0K�_U�����9HW7�F�mnr�q@�&L��BC��P7�#z0A�];_cV���{���,O�e��-&T��	�8�uL���0ؾ�� �Ȅ���T#��Sb�� ���lT��T�����C�g��bI�:3sd$P%��H�T>/�����v����ܳc��c^Zv������tN��d	��B.|M2&߇z���/��W��]����:�����L1�DT���f^�衶9`|�!�̀7�3���;���]r�\;l�΅]�xѼ�
6�Ew��T�����.'�hm��⣸��RԬp˕P���v�Njg�f�+�Iܼ�������q���l�T�+G&)d��.����r:���;�eV�7�k�4��~c���x$t�����'�{�6�|P���D����vv����L`@��y322_��m�S<���F�Ű+��J(ԉ	��Ľ�n�,H����9iĳp+�%�l25G��]c�w�>�oϭ���s�d�2����"�>1�����!��X�5}V���o�ಧ��h0���"      a   n   x��A�  ���c�.��h�B(`A��;3Cb��\������+S�ғ/�%9`��J��L2��j��m��,�mjP5���ݔ�Z;�j��j<�fn�7~^�� ī$�      E   H  x��R�n�0}�~�A/q��[%�i�*�q%4N��K��A�� !��ǘ8mW������̜3G����s<�-����~�Ĵ�t���u��f�v���|tC��
���^Av?��׮���1v���Ts��ƃ���e_�ĵ����'��q�� 5LK��~���<t�̮^��v��;< ��\c���-�S���]���z�� -� �;7L�U���Jڴ��%)KU�9�ڗ��Яn��uwP��_�BÚ�=�-�hc��ﭫ|B�b����c�x�l5�\
�S�(�y�q!��L� ���M�Ȕ�T�GP�j���6��A��`�F�*�'��J��.3��4�&�PE�r�e�i&����l��Nb��[�6ꌰ�Q�e��l����1���"�����h|����#S�M;6sg�- �f�;�������8hY���N��bRde�t�2�!E! ���3�2�?�g��"�Uó��xqԏ�D�-�呧�250�)����Uث<ӫ<���o,�=ezj.�s%?ڈX�zF��;������SE�*�e�d�����r>      G   !   x�3�4�4�2�4�Ɯ�@҄�H��qqq 4Eq      9   f   x��1
�  �z}�/��J�u��R�Y̒,h�-|����C�~7%�Cеy�P�u�$\���e�]"���l��*Iq�U���I�ٍ4syG@s8c�7��      -       x�3��L-*JTHI�Qp+MM������ \��      k   �  x���Kn�0���)f��\#Ew�������x3�1]��%?z����G��2��؛0@@���̒*m�Px����>7��pII��Y7ͻyvo��p�0��"|���WrhC@gh.s���qA0�L��kҔ#¦�E�@%ߤ@������J/H����zwJ�V��h��[C���8aG���fT|��0�Uř�6\aM0BI����-�m8�ȆP��`�@P4E@�J ���!p-xB�UvՆ]h�<������3�P Y�v��]y��M�Q�V0L۽dQ�>|��7�M�:��$�ꩾ�����\t��ُI��_Xaau�pI�dڠ���Ko�,U$�����:���J�7$0j*=t�cp�;��w���H^�b
v��u�M>t6B+�$�W� Fl��O~��{�z@�t�2����E�����
��������>����exo���IC�6K���'��I�����ב��/e�������5�Z�$K�      g   2   x�Mȱ  �9���M�����<�j(U��D7z��(�(��<��=h	�      3   h  x���An�0E��)� �&�6���J��ݰ�f�Xr<���r$�z�\�cCiQ��IF�����e�L3h�%�Σ�@jhհ�i��Z�5A�{�P�20tȖ'6�j��#�ԽF�ɰ��x�l�-��k��BwT�N[/y6��B(9�mm�{A.��U&�_�2/�Q^��I�J'��E���"��r�c9�:�|!{�����[н������8���e �r�[�F���"��tB�������_}:��Nܐ97�cDZj��~G" ���_L���*�C��B]4�?�%y��*�c]�������邙K6��̏O��Qx��껄7��,.�,�%o��:�
V��,nYU��4����      e   L   x�5�A
�0���1�����R�I#���z�<̌#��gy�0Fx��Q4��<j#
���������b�U��dD��<?      c      x������ � �      m   !  x�u��nd7��'�r*0���Ri�WSu7���$��圣VM2�i>���v�k]?��F�h��Q�/�Q����{�O���_��X.����~�`��j��!D�5�Q9A����J�]��FĀ�I�q�@�*��V�$�Y��z�/���G��Dx���� l~��du��xN��1W�ET+A�=�xͶK-����Me�>��Bɂ�l^x����q]�L���Io�vU���Q>��g�=�Ъ�y]M|��c�KA�oޢ�aS�R]�Ǣ�դ3QW��~��os��#�U���!��&����?�di�(��'�&�4�9���J�.E�d[�������AS��y��Hx�����?�Fc�P�������"$�WT�������ʅ����K����M��\���]��)����)ϛ���Zʷ�m�:�i�3=x'�8�üi߷��ݖ���h��u�AP$��Q��y���T�d7��j��k��R8̛/?�	�6H[E�<��1B�fŬ�+�ٿÿ�+�� !SӔ�BN/:���ew�xfqXh%6-V�f���_0�J�j����+�a8�_[Yo�=�L�B]V�0vq�`�sxhT�6�]��z)=�O^#W�P�1Zw�8D�R���>��/�i bf��P�ͮ[�ך;k2r�p���Ykd���!a��9�^L�%�WF�":���;��7�+'�'}۰�8s�rJ��y���<�C����_����e��}�AM�\W���>��Z>�:���#_�NTj!�l��f�|��=��o� ��ޑ      O   �   x�m�A
�0@���9AqBlu��k�+7cu MB���<E/�`"���pp��H�U�!�O\IwրY��"�X(JNe��~ �K�r��NO}�^������;*=	�*G������p�?cf��2�F)�sS>�     