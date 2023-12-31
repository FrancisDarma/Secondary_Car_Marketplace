PGDMP     9             
        {            secondary_car_marketplace    15.4    15.4 ;    L           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            M           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            N           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            O           1262    16726    secondary_car_marketplace    DATABASE     �   CREATE DATABASE secondary_car_marketplace WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
 )   DROP DATABASE secondary_car_marketplace;
                postgres    false            �            1259    16780    advertisement    TABLE     I  CREATE TABLE public.advertisement (
    adv_id integer NOT NULL,
    adv_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    adv_title character varying(255) NOT NULL,
    seller_id integer NOT NULL,
    product_id integer NOT NULL,
    city_id integer NOT NULL,
    allow_bid boolean DEFAULT false NOT NULL
);
 !   DROP TABLE public.advertisement;
       public         heap    postgres    false            �            1259    16779    advertisement_adv_id_seq    SEQUENCE     �   CREATE SEQUENCE public.advertisement_adv_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.advertisement_adv_id_seq;
       public          postgres    false    223            P           0    0    advertisement_adv_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.advertisement_adv_id_seq OWNED BY public.advertisement.adv_id;
          public          postgres    false    222            �            1259    16764    buyer    TABLE     c  CREATE TABLE public.buyer (
    buyer_id integer NOT NULL,
    registered_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    buyer_name character varying(255) NOT NULL,
    buyer_contact character varying(255) NOT NULL,
    buyer_email character varying(255) DEFAULT 'No Description'::character varying,
    city_id integer NOT NULL
);
    DROP TABLE public.buyer;
       public         heap    postgres    false            �            1259    16763    buyer_buyer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.buyer_buyer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.buyer_buyer_id_seq;
       public          postgres    false    221            Q           0    0    buyer_buyer_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.buyer_buyer_id_seq OWNED BY public.buyer.buyer_id;
          public          postgres    false    220            �            1259    16737    car    TABLE     �  CREATE TABLE public.car (
    product_id integer NOT NULL,
    brand character varying(255) NOT NULL,
    model character varying(255) NOT NULL,
    body_type character varying(255) NOT NULL,
    year_made integer DEFAULT 0 NOT NULL,
    color character varying(255) DEFAULT 'No Data'::character varying NOT NULL,
    miles double precision DEFAULT 0 NOT NULL,
    price double precision DEFAULT 0 NOT NULL
);
    DROP TABLE public.car;
       public         heap    postgres    false            �            1259    16736    car_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.car_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.car_product_id_seq;
       public          postgres    false    217            R           0    0    car_product_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.car_product_id_seq OWNED BY public.car.product_id;
          public          postgres    false    216            �            1259    16728    city    TABLE     �   CREATE TABLE public.city (
    city_id integer NOT NULL,
    city_name character varying(255) NOT NULL,
    map_loc point DEFAULT point((0)::double precision, (0)::double precision)
);
    DROP TABLE public.city;
       public         heap    postgres    false            �            1259    16727    city_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.city_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.city_city_id_seq;
       public          postgres    false    215            S           0    0    city_city_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.city_city_id_seq OWNED BY public.city.city_id;
          public          postgres    false    214            �            1259    16803    negotiation    TABLE       CREATE TABLE public.negotiation (
    bid_id integer NOT NULL,
    bid_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    adv_id integer NOT NULL,
    buyer_id integer NOT NULL,
    bid_price double precision DEFAULT 0,
    nego_bid boolean
);
    DROP TABLE public.negotiation;
       public         heap    postgres    false            �            1259    16802    negotiation_bid_id_seq    SEQUENCE     �   CREATE SEQUENCE public.negotiation_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.negotiation_bid_id_seq;
       public          postgres    false    225            T           0    0    negotiation_bid_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.negotiation_bid_id_seq OWNED BY public.negotiation.bid_id;
          public          postgres    false    224            �            1259    16749    seller    TABLE     f  CREATE TABLE public.seller (
    seller_id integer NOT NULL,
    register_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    seller_name character varying(255) NOT NULL,
    seller_contact character varying(255) NOT NULL,
    seller_email character varying(255) DEFAULT 'No Description'::character varying,
    city_id integer NOT NULL
);
    DROP TABLE public.seller;
       public         heap    postgres    false            �            1259    16748    seller_seller_id_seq    SEQUENCE     �   CREATE SEQUENCE public.seller_seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.seller_seller_id_seq;
       public          postgres    false    219            U           0    0    seller_seller_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.seller_seller_id_seq OWNED BY public.seller.seller_id;
          public          postgres    false    218            �           2604    16783    advertisement adv_id    DEFAULT     |   ALTER TABLE ONLY public.advertisement ALTER COLUMN adv_id SET DEFAULT nextval('public.advertisement_adv_id_seq'::regclass);
 C   ALTER TABLE public.advertisement ALTER COLUMN adv_id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    16767    buyer buyer_id    DEFAULT     p   ALTER TABLE ONLY public.buyer ALTER COLUMN buyer_id SET DEFAULT nextval('public.buyer_buyer_id_seq'::regclass);
 =   ALTER TABLE public.buyer ALTER COLUMN buyer_id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    16740    car product_id    DEFAULT     p   ALTER TABLE ONLY public.car ALTER COLUMN product_id SET DEFAULT nextval('public.car_product_id_seq'::regclass);
 =   ALTER TABLE public.car ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    216    217    217            ~           2604    16731    city city_id    DEFAULT     l   ALTER TABLE ONLY public.city ALTER COLUMN city_id SET DEFAULT nextval('public.city_city_id_seq'::regclass);
 ;   ALTER TABLE public.city ALTER COLUMN city_id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    16806    negotiation bid_id    DEFAULT     x   ALTER TABLE ONLY public.negotiation ALTER COLUMN bid_id SET DEFAULT nextval('public.negotiation_bid_id_seq'::regclass);
 A   ALTER TABLE public.negotiation ALTER COLUMN bid_id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    16752    seller seller_id    DEFAULT     t   ALTER TABLE ONLY public.seller ALTER COLUMN seller_id SET DEFAULT nextval('public.seller_seller_id_seq'::regclass);
 ?   ALTER TABLE public.seller ALTER COLUMN seller_id DROP DEFAULT;
       public          postgres    false    219    218    219            G          0    16780    advertisement 
   TABLE DATA           o   COPY public.advertisement (adv_id, adv_date, adv_title, seller_id, product_id, city_id, allow_bid) FROM stdin;
    public          postgres    false    223   'H       E          0    16764    buyer 
   TABLE DATA           k   COPY public.buyer (buyer_id, registered_date, buyer_name, buyer_contact, buyer_email, city_id) FROM stdin;
    public          postgres    false    221   	w       A          0    16737    car 
   TABLE DATA           b   COPY public.car (product_id, brand, model, body_type, year_made, color, miles, price) FROM stdin;
    public          postgres    false    217   �       ?          0    16728    city 
   TABLE DATA           ;   COPY public.city (city_id, city_name, map_loc) FROM stdin;
    public          postgres    false    215   �       I          0    16803    negotiation 
   TABLE DATA           ^   COPY public.negotiation (bid_id, bid_date, adv_id, buyer_id, bid_price, nego_bid) FROM stdin;
    public          postgres    false    225   ��       C          0    16749    seller 
   TABLE DATA           n   COPY public.seller (seller_id, register_date, seller_name, seller_contact, seller_email, city_id) FROM stdin;
    public          postgres    false    219   l�       V           0    0    advertisement_adv_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.advertisement_adv_id_seq', 224, true);
          public          postgres    false    222            W           0    0    buyer_buyer_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.buyer_buyer_id_seq', 132, true);
          public          postgres    false    220            X           0    0    car_product_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.car_product_id_seq', 1, false);
          public          postgres    false    216            Y           0    0    city_city_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.city_city_id_seq', 1, false);
          public          postgres    false    214            Z           0    0    negotiation_bid_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.negotiation_bid_id_seq', 337, true);
          public          postgres    false    224            [           0    0    seller_seller_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.seller_seller_id_seq', 133, true);
          public          postgres    false    218            �           2606    16921    advertisement adv_title_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.advertisement
    ADD CONSTRAINT adv_title_unique UNIQUE (adv_title);
 H   ALTER TABLE ONLY public.advertisement DROP CONSTRAINT adv_title_unique;
       public            postgres    false    223            �           2606    16786     advertisement advertisement_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.advertisement
    ADD CONSTRAINT advertisement_pkey PRIMARY KEY (adv_id);
 J   ALTER TABLE ONLY public.advertisement DROP CONSTRAINT advertisement_pkey;
       public            postgres    false    223            �           2606    25093    buyer buyer_contact_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT buyer_contact_unique UNIQUE (buyer_contact);
 D   ALTER TABLE ONLY public.buyer DROP CONSTRAINT buyer_contact_unique;
       public            postgres    false    221            �           2606    16902    buyer buyer_email_unique 
   CONSTRAINT     Z   ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT buyer_email_unique UNIQUE (buyer_email);
 B   ALTER TABLE ONLY public.buyer DROP CONSTRAINT buyer_email_unique;
       public            postgres    false    221            �           2606    16772    buyer buyer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT buyer_pkey PRIMARY KEY (buyer_id);
 :   ALTER TABLE ONLY public.buyer DROP CONSTRAINT buyer_pkey;
       public            postgres    false    221            �           2606    16747    car car_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (product_id);
 6   ALTER TABLE ONLY public.car DROP CONSTRAINT car_pkey;
       public            postgres    false    217            �           2606    16885    city city_name_unique 
   CONSTRAINT     U   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_name_unique UNIQUE (city_name);
 ?   ALTER TABLE ONLY public.city DROP CONSTRAINT city_name_unique;
       public            postgres    false    215            �           2606    16735    city city_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    215            �           2606    16809    negotiation negotiation_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.negotiation
    ADD CONSTRAINT negotiation_pkey PRIMARY KEY (bid_id);
 F   ALTER TABLE ONLY public.negotiation DROP CONSTRAINT negotiation_pkey;
       public            postgres    false    225            �           2606    25095    seller seller_contact_unique 
   CONSTRAINT     a   ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_contact_unique UNIQUE (seller_contact);
 F   ALTER TABLE ONLY public.seller DROP CONSTRAINT seller_contact_unique;
       public            postgres    false    219            �           2606    16893    seller seller_email_unique 
   CONSTRAINT     ]   ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_email_unique UNIQUE (seller_email);
 D   ALTER TABLE ONLY public.seller DROP CONSTRAINT seller_email_unique;
       public            postgres    false    219            �           2606    16757    seller seller_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_pkey PRIMARY KEY (seller_id);
 <   ALTER TABLE ONLY public.seller DROP CONSTRAINT seller_pkey;
       public            postgres    false    219            �           2606    16932    advertisement city_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.advertisement
    ADD CONSTRAINT city_id FOREIGN KEY (city_id) REFERENCES public.city(city_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 ?   ALTER TABLE ONLY public.advertisement DROP CONSTRAINT city_id;
       public          postgres    false    223    215    3220            �           2606    16937    negotiation fk_adv_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.negotiation
    ADD CONSTRAINT fk_adv_id FOREIGN KEY (adv_id) REFERENCES public.advertisement(adv_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 ?   ALTER TABLE ONLY public.negotiation DROP CONSTRAINT fk_adv_id;
       public          postgres    false    223    225    3238            �           2606    16942    negotiation fk_buyer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.negotiation
    ADD CONSTRAINT fk_buyer_id FOREIGN KEY (buyer_id) REFERENCES public.buyer(buyer_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.negotiation DROP CONSTRAINT fk_buyer_id;
       public          postgres    false    225    3234    221            �           2606    16894    seller fk_city    FK CONSTRAINT     �   ALTER TABLE ONLY public.seller
    ADD CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES public.city(city_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 8   ALTER TABLE ONLY public.seller DROP CONSTRAINT fk_city;
       public          postgres    false    215    219    3220            �           2606    16903    buyer fk_city    FK CONSTRAINT     �   ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES public.city(city_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 7   ALTER TABLE ONLY public.buyer DROP CONSTRAINT fk_city;
       public          postgres    false    3220    221    215            �           2606    16927    advertisement fk_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.advertisement
    ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES public.car(product_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 E   ALTER TABLE ONLY public.advertisement DROP CONSTRAINT fk_product_id;
       public          postgres    false    3222    223    217            �           2606    16922    advertisement fk_seller_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.advertisement
    ADD CONSTRAINT fk_seller_id FOREIGN KEY (seller_id) REFERENCES public.seller(seller_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.advertisement DROP CONSTRAINT fk_seller_id;
       public          postgres    false    223    3228    219            G      x��]]oG�}f~ż_� ~����D@,��:Oz��x �T�a��ߪ:��C/Z�ޛĖș��S��NOF����_���o���߳ſ���x��/��v9��K����?5�\��؞�m���鏚�Ǧ{=_�}����p�/��{w<�4�������v���x�N�B�?���ˮi��\:�뮥~��=�4/��é9��=�F׼�������6���ޟێ~�>�f4��+����t���i�u.��ٵ�[�Jz����>��l.�vGO߿�Zz�;ѷ��-�'~�}oM�G�Bۼ��m+?Դz7�4z#z�w����t�w���?�S����[��N��f4Y����t9��U���>}x��8�R<�3�C���y�Þ�w۟��~C���i6�����r�Ӧ���~�7���xbz|z�#�$�}ֱ����N姴��eG�ތ��l>O�sڈy�U�����e����l�nC���׎��솿���w���xi�iUe����j6{��3���p<^^�C_�g�E�R������L�v�ҳ6�/�;�d'Z�vם�������f���_������9w�V�n/��\�i��o��lS͞-ҎBӝN���e��9$��'��i����m�����&���%nF��h���6�|���$�0���ط�캬|��8rR[>��~O[�J?EK.�����Џ����O�>���f�Λ�t9Z�c��W����%+?]�C_{3ٸ�� @OM���;9>���i>��y71Fy1Z���"v�;�^y�x�v���9���h�M'�֕G~/o�ћ�ʗ�[�Ӫ�1��m����!�2�䆒��4���>��kvNoI�+�?V�c+M������m���	����o6Ħy��'2� ��+��(<$�Ş�����G���S�47��<��������dHK2�����-�B��u͉V���%��1p�;�1�NX\�;��_��=��w�
��`QO��e��/n���M�§'V�_��Ή�%�sڪ�h:'�ל���v����g����nG'�M��.g�1�ɢ�-�%�$��|�d��a�/����y�c�
WI�d������+ʧ���m�	LLq����;{D��3��!�����/�4�^:
��w݆�����Y�Am��N�v�K7#:V�	�w�JkOn���N�P|/��1�'y��h1��E�01��y���Gh1>�2� ��&v��  � ���p��A�%��M#�Sp�>+����#Z�)��S-$����K ;	�1�K��;����1$��j�[�"�1�ï��Z9���0�F�J�~j��Q��˕_A�6a0z���\2ي�2:�`n����Λ���a�|��͈�>��Y�����S�������c�A|�q�x�\����K�d'u�ؾ-��5ddM�ёҋ�F�ǉ�س!���#.�8���hMO<�5`���k��Ƈ^,-N�r��(�'���aMM6���V�	�C�d�8�q�i�#D&�ОK�n{B�iӤ�o��v������Cz]�o�Fx�l�^�gD˖�Fo@�}b�6���� #^�����`��_�iR�"U�/�',H��Ӱ��k�{4��F�z`WwÀh��!�1�E�_	�뗌5}�Os����	��u��V��"s������j���Y<C2Td��,������r�7ͯjG�@�(�s:��5v�8{���M�il5� �"���lj�\��ˊ�3y%���I�*��9DI��<�b�A=�%�.�{�}��hEk��=<3��Hi�X'!-Rx�"��}�eߗ���(DX�
gc<3����'���ɡ��R� ��(��i5E1��\��Z�|ZX^y�Z�����N�m�3�y�%<���5J|H����В��}GO�nZa�' 	����Y�J/3c�b��E��}���m��x��M���l#��|�������O��4y	z,�-z�ZL�wn	�����@��cf�A�� ��v$�S�M�ޒY>tN.�;��d��)}`��R>O��Ķ�2)q=���"ܟ�ZH����GG2j�H��h�)�m2�b��U�i����8rJ��(�}��tnD8]���v�	�%�m�.�'Y���eD�/���
���4ٜ!,�Y78�~�֒����'�P!%"u�ւ�G&?�r��&��{f���Np泘DB���}�v=X	��ц�;���O�y�t0���j��5�[�Z�~���� |���r�3(��S.KXEv��/�kzVK�wdW"����+ͣ1�eg跁T�z����N��������o")Iʆ�H?���C�7t���حח~C��0�e
�=�\�7�A���ѿǓX�o�Ś��.(�yl����ΘU�pt�2l��`�H��e#���O�e�)j��w�'�
X,}XjR��9�_��b,��0Z
��dǴ� �ϙ_�ӽQ��~H�#(+�Nv�8�a��ڜxF���T?	AL�!!۝$vfZ��B%�$������^�3�C�A=���Ń�ڠ����JGn���G��w�"�A(�t��0~9�f��4�A�_�	���n�s>���ʌr��p*p��w�����̧�g@�t�3 �$�[������
����y�5w��p�� ΈS���ctm�b���3�M�SM�[�+ M���R�4E��X{�i�)s�@� ����8$���n%�<�9
���JW�uV���l�I;9���� 	���bX��L�Y����!h۪�R kPux��JP�1;	�8�wr� ����{Zt>K=���nsV�g�"����*�/����KVR�'άѪ�"R*�g���> L(���Y)��"���c%P�;����rؿ�bq�Y*�^>���Z����,q�2ncVQwE�����s�U(��@&��_�e9���	��j��)�����v,��Kx��/j����J�M9��5rhH�Z@�:t�býC�A���G�*b����C�'��D�~�>򚠌I�@R<N����#��0ʬ����O��h�x�g�,�g ΐ�5���W�������\�=�`�@�(�	b��j��<�UrJ�;�E�������o�?�DƼ�2�E�!�-��D�;���߱S.�~���� g+�H�"�� ��"���pϞn��K��v��ſ�|�<�@/������&��-P�G�g�z5�Iz���3v��V�oP�b�(����l�]�q��PZ����"�kPb��ܷ�K�Cr�t���@�)x��np�4���P$��9,$K]p���Ǽ������D�#Cږ�v^��%�%�\eY���kq�^!���tQ��ʊ _P�O�4׉���}�N�a���f����s���XM�]i�ZY;�3<�"�|l���&��-O���-|��4��4���91�2$��k�	" �x`^%Z��Y3�xr��
���l��Z��#���C��ZJ�2�(k��VI5�Lʔ��k�E&�.���Y+
���Է�w���A�[���v���ypޠ��Ƨ}Է�X?J�g��9��l�8]�'8Eجh2�g$��I���� �[>�94�1�?Qxl�y�X,�e��Y�
b�?H�	���Qi�E-��J*��aQ�˙�I�#��VQ�Wb�N�ȔKg��jkt�Ek�担e�9� ���NBr�Ӊ�Z~��`�s���6�VpF��W4 �/��nǡQn�E8�b�''��5�,jQ�8/],I]��ƞ��4~�0c�Qː�M�.H<���%&	'@ �[u.F*��I>�bך��mS-n��Y�4T��B&��!Hi�����.9��e��<+m�P�X�	 ǂ\	� <>���x1�!����GJfٖ�2�xz��Z��|��Zؐ�V�@ƫ�1\��:9+�P�,q����E�����Y�^������ ��+d)�bhX��5�4/�������E�t(�)YJ6�P����w<����+��d�
�� �h楌���'���,�    �yr͹i#k�C;we��g�`!���)Z�_l(��O�T&�n5>W����_x��ghc����
�<����
��gF�%^F�rӈb�tm�vY%\5�{_�uϦ�9!0��f�V'4F⣬-�Ve�Џ��&��F��o����� �U��U`�A��P��
��r2�=��97(z ԇ�:O	A-}D �~x'����4�ʈ5r'�i�lbF	p8�`�m��"VJېL~�e[1>��H�SM�A��@ز�?��C��(��@�a
~,��CEW�M)1���gچÌŲZ�8��&ς���� �jH�u�BS�<JBpK�l��vY���Z��8����Vp���c�mA	|��K���63�0]�!E�s��X/�tfr��#���F��v�e-��Y����*��0i����y�����ի��}��9�b��&�X����0�<T�G�2�X�Ni4\�y�����<\bci�xKc��o�gr���'��iǸ�?�7��:K?l�Q,���G͍��̣w�⵨�!�P��q�v�@2�jD�.ÁI��ńb-P���(�6J��yT�8Ϩ�K򥿪�?}+� ~�D���=�S��xu�eU��B��hT�*��2tJ4�dZ�K��Bi��7���ޢR�n�dL�=K��ln��z�F�e=��S�RDƘ��.�+?Uh�7;�Æ�K�-qvVR<e:i�E��Eg�m��[��>Eۗ�*K��x�(7�z�ȍ%�^(��)U�T�Y���@m���6���?#��fh$���^����5O�,,O\�����
����4ʐ�	w��O�8�����(�b��@X�M)(�����e�z,���{TV��r�X����Чo��~�2�(�M��>s��q�����FS���7%��$k-J��^�v;�M�\�.�u�1�o�?(pY�����|hУ���6_�� n`PY �4��@�Gyɼ�G0K�6o$-�йz�m��%���,NF��"$�z�0%B�Z���%��t駨JJ�C_v�����Q`��tG���]9�[���$dY��>�2<�-���|1Z[	t]��cN8�$3Xt������,E9�]��q��y���7�hi�J��#�4M�F��f���>�\��Q�""`�"����u����S8gO�F�axq]hAD<�M�@��Ӵ���{�2�.�#��'�x�sw�C��/L٠��Oi?��Ό�[ׂ^����Tn<�ѭ����<����7�h=��r�,@"꿋�(�c�[�ZOv��L�ψ\�����a��ĻEJ����6!� -?4��HӜ���FS� f�y�.3�BD�T��_�¿�.L��-��? ,��h5��?qhy=O�2�[�y]-6�7:-#}N�$¶��TX{�Ξs�;����w�(�&k�699�|b�͂��MR{ѵ����;��*�QxʺZ�ֱco5<N��?em�[��i�KK/�1I�ǁn4XGr+����u-�Lq��� �8)u,<�*d`���S����� $��c�\ׂ�]dl�A�J�2����z������T(Z��P��6a:�����X���@郣�G_:8M��52$��X��R�JJ&
	��5�(u�hQ0N�6<'���ܻ�����o�<�������ػ+�H	�{Χ�e�N�X��>�hD��r��
g�L�
�ה��[�Ƿվ���ޮ%��`�3@��J�^�9�չ�h0���o^bO.Ǽ�L6���$>�����ִ���~�k���C��;%-"9"1�Yb�\rł�yDo�TO�H`�q��-���{�������Wi�(���Oi%���D�1���9���$�ET1�E��$q���U������Yk|[������MY���]{ՑkF�L��7;��vC���fH��	9hMKǷo�M��@4$g�v�-�	�
U���M���.�Wv�H*�PL�.+s[M�{���Lqj���w���O@�~(�k�p�����J�7(Qf����ՠ?^�%�w-�3mX���)�>
I�hdq3~)��c�>�,�B�����ȗ��D��ABV4}��p��8w�k�o�.X��PM�C�Q�'��	�����QgH�|D��chuY������
Tb{Y
+My\t�����b�Ji<$��gA<���Zwny� 5�5��K�T���dHiQ��\��e���U1,'�0��k����"@�א1=��@0���g
\��C #H��W��n4�j�e��P�T��M�W�k��;�2�jH	�FG���Bu�4�a���Cu���0�j8�w�
�R�S9�J�+�]����9�6��Õ5�f�M�X��#S�����ְ��j�����eՄ���p}6� ��$��=����wF�f�ɔA{�s���r���v�zbj��:��������k���a�b��]�6T�B�?d���dX��FPi��M��ު��Y�g+P��k3�@���9����d��(�r�N�kr^�K��j2L��)U	�f2b
�T�Թ��FT�H⸕^�4(���Q1��3�:h����3��i;���ʃ�VE��\��E;� ��t؉C��b4�L���Tޔ<�kUʰ$M�|��y;r�J2}.�ڒ֨��X�p"i��T\d�!e�U�����8�f�hm����yõ��:ibV&��^����/��:�;�'"��y��%���<��Aq�H��|���U�hMQW2Pd�zE<��z� f�����&���L��<����; n�I	�jm���e-�^����[�a�䦽��<^#��9������"��O]�8��>��4���
���i��Uy�a�>��;UuN���1���4R��T�OUu���s+C���	j�����n�[xl�MP�x�u� B��V~
�l����̡y]�*	���7��ʦy#�_;¤��@.��"䛝m�0���:Z�򌬖��U�?c҅���pL���^\N�X��H�Ԇ���ݖ���r
;�!	}fP�&+s���䛪�߲K7(T���V�9�P�yڿB<�+�Wρ{WW(����#Yw��
Yɜ<r�<�$�w!�Z��R`g���1�f�"9������ŋ:��1I�K��:�]WOvN]淞�U���&�@��"w�i�O�Œ�
�dWܠv0��z��b���l��^1����x2���qU��N/38��?L�|w	�c�Ҝ�.�I�c$���Me�Vr�+Y� d34 !g빸�aH�R'RBs��H�M��)�,�� ��<?�X�y�m����ϺWE�za��pT!�H�������j,I���D祬�@��7#�;S����#?�����2An^��<���qUW*kΜp�D�*����+i����m�$��)�Rn�EG��
�U�(��@�2C��wI����Ii��\[��М�9��Y�7D-=� cH �I㜥��^�U��2��������v����d������� �h�M"~"�&�Ƃu�L5�'0'�-��o�� #x`Z��k�$w�j,e���簻"�T��^���r�Uu�T�;Uƴɽ+R��T��W��>��!M��X�ݜ\�<��J�0g�f��(+��%9���o��q.18� �C�y�]X����'ţkj.���Id��Ht�lw+�T����&��4��NE�����c-����}	a��l������P3to\�ŵ����ZqA�L���Nא�C|�)�#�\\>ڹ@��rz�n�Z������P�jR�o���|��'��V�=-�l�0����$�ʧ�Fi���M��J>sQ������#B{����P�W^��d9q�b]�rAv�9��K�D�ѱ	��PQU����n�>Mq껸1 u��é���*4ۯp2{l�.���m�����켲o�Mή@��AwUo�|y�B�^��J5�w@)�^.2��B2ܚ��"���s�n�H?ǖ��4�c8Yb��r̢֗	����K0�u'�z�h���cm�B��`1D�ɵ���6�qU�룬�Mm����p��� ��A��Um� �  y%V�!���gS��k\��
h]�>�!'��C։l�l�׭��=?��e�� mN��	�-ѿ�����~-�|�J�hϺ�1hs9kϖvF�Axo����ō+�^�p���������sqb���y�΋�:��H_T�j���+��J�������0�%��(]_S���l�
�3����I������^�e�P#宄�cت��)-l�f�t=0	Y��2�OE�7
SҼ,���C���ྶ�`�E�
�����Ҫ�t�����,���/��l?hҮM�8��vAz�6��1q��8�V��Mv9��crτu"��"cɦ\KA| ��T̬��w��#Ɩ�V��ک�����KUt�k��t=���̣�E*u8�Q}h��)������Vf�4٩
�=ڙIY�V�/"3������4�,h����� +�+hp�����NRq� t��Ii�^p���C�����O�k� G=$�x���K�f�0]R;���o4񪦧S?�lv&�4Ua1�`��a\�Jv�����j�hu(����md�}�Ll�����L�%��i�0��_-GхXU��#8v'���%6i�LsEQWMm��s�zo��+(���\˸�i<�،�@��r.J��c�>��b�M�P��UR��Ul�^�Am ���s.�,xqu-�kI�J���6D�n�$�k���
�QR��cl�}5�K�M��t.��ѻ���{�ZO	���q���=�&�̜'��q�BVt��9n!IWWV����)t�<~I���@q!���R�ȧ.�w��_�иg0!~θ*�uՂ�S�E��a��)T�Og���/��yo���GcXU���,(�U�K!�����j~�.���N=�*ja3��<���;mM�R{k���[G��2��~�4m�^D�{���j��Je"[�٢�Y��芯�j�3i��m�ˤ�D�p7��7|�����B�B��bÈ��NU!�[g���Q�0�d/ȉ����,k\e+���zZd�c-��Y��/�)�H���4<'�����}���sU���Iu5>� E�s��K�T!=�*� ��
�e<�ۛ� z��\�j��w��V��k���3��<�
e�F�4�<�jli��Mj�"7-GҊ�׽�0�D�Q'�Zz��~^���
E�,T5?yO�4�ݦ��X�>x#����c�&�j/�B�v�eJvʥR#(��ZHtj\ݵ\w}ĵǬ�Xʴĵ�Z�.�L�W�M�]�~�t�~��02<��ӶP'�fʪ@�}�4B1����AR�����E&�j΄k�`�_��T��̸��!���Ԗ�cT�Ւ�MX��CЯLA��ۭ8���T�x����|���a?q��>��(�{/��z�8"���pr���)o�f�A�'���7:
��K)Qp��P�+��6}m�iDS(�zU~�56����e�z�L!dX��j�Yv�e$JY9� � q��d"I��1~7YΫ�J�v���K%u����~�*����:!������UK@�A�O(�����/r.� �+7%lX#WkvIƾཤ�%p��B�VE�b��s������W�%��t]�`n'����$=��֙T���U����6�����7@���%ݓ=�T��^����/�_�*��/?�p�i	#��Ƽף��+#&��(�nvM�K�h��_��EU`�j����o
z�-oCVq��"e�JU�(�RF)��ō	B멃���
��3�C���X-|��LIN�lu�	��>(���g��W̭tC�(f�7�ƌ}ӫ����甫w�����]����̧3�'U��L���͉� {Û�9a V�-�[�F)���n��T�L�V����o�׶���{d����bUվ�pp�Ɣ�����\"T��"����È��j��+/�#T\p�Xx>^5�P<��B�7��d�I=�邒Bs��@��#�����ԕ��$��L|�&uxK��&T5�ཁ�mF}��E�=�
�Iy��%�����-C����~�6(�����~��r���j��e\�1E��{��JYek	�����d1V�ްDV��.M'��`��8D�S�YN���NxU��
,#_��B&��)�/W|�q��\�z.�r*�R�Ê!���M�%�	�-T��g���9��*n	L���v�=o���eD�N(����&������#�0�w���ʥK�cyv؈^Mu]�I�tpG�	�Vt?q{�@@4>��ubA�Z˟M4�
ʬ�����2T[�*g.�̯a�
�߻cqŻ7C�4���C|U��\� �:SĻ���mާ!�A?pQ�y媥��v�����zj/�.P�׵������i���^'�l�,��G��,�S���5�z�(��뉑_�^�����˜����L"��h������P"	G-����!���}.�a~ڏ�,(��e^���˖��
^����_�E0��X�/zS4�����ZE\��M�,Si�0�e�;�7)�s�/�"l�����356�?����s�D�kiT�FB�&c�Ep�K�)�wMڧ��bJ��·�Q_򹅤�`�7O��IU�ޫ������.�f][X1D(�[�.�����2�
x�`NOT���b²7~\�D�6'zJ>:�Y2���Lʹ��(����2|������Nx�fl��[ ����¾�_����@��<k��f�$����?-VW��lUMqoP`:�d�h�\^!"��z�W9\��_�r��TUВ 8=��d[��hO"/����Oq)"�&K�*(��u'�p�@eП.q�S ��-�C�i&*'���r'UI.�}�W��D��B��2$!K���\#���j�r�)5m�(�3IW���,'S�%�����s��'ٔq�4,��.�����^�����e�����hm�p��f��p�}Ey]�7��b�piR������̪����WR�E�3���N�v�[�a5��=V�/�~�i�"�;Zk>$�ֆ�'UU�Ԯ���+*���8z,�w�VV�3�,t(c+������	�j���w�4�/�.,��T���Žy�.�|�Y�nW(�BF�ˆp����r&6䠠�q	;�7ݡ(��aW�_UӺO7n��M;�s�v#����[�QC� ��b
%z�vѮܘ=pyx��h�KEi�������36�����ט��(����I�$�"XK�-����ɼ�����:��CŽ�v�j�wJa�j!;c�δ�t9
C�A���c�=�X�/�j��K�gYהo��ɾ�G��9��{Y'UA����� ��]�V��Jk�������7u�>�|Eږ�L�z��l��Hw�yo�n����Ha���5��z�2�\n��IU��7�v �>K� ��J���(4�D�����F,�a��K&�ԡM�,�BO��U�xS��4-��P��9��[o>��&f�a�-Lvi�^J�w-�p��6�,�T��J��{OǷF;O�z\��S.� }�/C���ɭd��!C�c�$&U�.���Ia7S�.���I
+��<�����91Ǹ�7�`^x?�J���so�a����1gU!̲���؍e�|[G��^��އd��{!D�I���IUL��$�I����R��X?Tt؜�%��B䙭M%nR���da�Xi�7�f��f��M�#�zG���ݖ���Ƿ֗:�*oݝ]��d �K[� ɒ�,��C��2�ۣr�n{�|����m�seG��H{��RՑx��n~������      E   �  x��Z]s�8�}����
 ���t�q:q�+N6թ}�-Y�%�Z~X���=�d��2=]� �{Ϲ�\�'��<c6�,��_y�/�τd���"��]���}�tUW7�?ӻ���?����E�U���k�n������r�Y��2�y�_���/�}z�־�U�W�3�:-��
��r�/]���?�]7�$X;�����ʥמΆ��\�NU�3+�L�ݺ�uU3]^F��~��w��Oo�.����|�=n�]~gOV}��t]ݍC��Td���η8c�i�v��@)=�I(e��+��WEqZ�Zt���ґ���+߹�k��.��'gڦ�X�<�j�83I��*b���ضu�[%̈��EʹI���L5�E����5����!�"-m*r#��-]�u}��X[K�m#k�yZT˔��P�Lp���d��5�\��J²�E���!1���-��ƭ����ެi�82hL��5�u�C��2���<����o��o��r;���ש�6��ˤyD���Ey���c�<���7��H|�#(ᰃ(^���Tڜ%-��M�v�V�e�
s�ch��Xޗ��������d��Òm?�<�nUWg�P���b�l��)�6F�,�`�<��\�)�K��a�\?�P����C�2�d�Xf%��o\�l�8^��H����u�Ns��03�@�FeȶI~���C�j�? B.������U>���pkӜ�G�C��7?�m�o���=��H�n��[.2��J�}ۗN���1�<
ݮtO  ���_X"H�^i����ڀo����1M�+����- �G�p~m��eB,Yo܏��hB]�(�q>�����A���"�*w��1~�t����Ko��]s��	��� ��ܦ��
��?;Đ������:��r%��f�����t(FT�w~�o�J�0�g�<�X�������)W��,��~;����1�~BR�.��I#�Wbo�ʹ�y�c�����<;�����͟Q��1��i��_RV���W���D�ź��:4n*GA�Ũ�D�^흔�p��cX�<{3}����Qѝ��q�꩐,�RY����V�OA� {�R�S'�$���k���!��䋡��UP,԰�+�tuȨF̙��eЫO��yf.�����1����	*[.k����M�y��\ɤ�􎝟��z�@�U�o}�R3D��׻��#L!�ڸ5)�zݹg�k)y�Ga��*}�WHp}.]�<��B�
#tUۏ�mY�o��v�؄���%x�ZG�`�%�C_��U]��3�v([$>�����6�7��AE1�k�e8L���1;�n8{����>�wO�,����0��εkF�A�cȥ��r_,U���'����	��n,gq����B�װK�{�8���I�//�#�jT1U
y���{���w�v�whf��Xf�̦�]U�qυÊ���=ڵ/M����o(����m����	2��o�p��	I�LM��������(��*=��	�E���>���\�S�췃���1@_��.zY�
4�}R��ӟ��w���Q���o����� �%�֖�f�
=�$7��/[����!iJh>�����S���/�xs[�Ƕߌ��AƠ�.a�	����>)�@YY�� ,4�uݺ�����<����Ͳo)Z�xJJ�
/���|���i�1d�]���}�m�rM�����iW�QH_��O@T�PN��q���EC����`�Ƃ]\�����7Q�Qe���TqCܴ���OF&1\��=���4��������d���L��b����q9��W��L�'�e�r�����>�����VZ�
*3pI[�v�~�r����ã#�>h���ȱ���A�$��}W��3/p� �r=��}�b������! ��<39���"�S�PіL�k��`�բݑ�a�(�������)ɩj�X�Y��4
��uVI�Kӷ�g&Ϯbp�I�ӯ;�ۣ�F'6���s��Q�˾j��R41���CY�����$�H/�j�1��݁�P�p��QQM
8
.�B ,�,�4������a��z]�*Ox���L�H6�a�ZOY@ǐ:o���㠠.0~�mF刢��j1�8�/���f|G�p�
�PA�?���l���I���hzU-C�lO�>�j�h��F�n���i�	�RǀL��GuG�f�[Bs��t��x��:X3����lB�sj�:����|u�S�c���Ļ�_� �>�=�*a	��'nC�k|g;�	::�*����{<��h��=�HF׸)���?#���h��d΄��*p6��P�WV� M�m�$�F�G���h��^��rJxE�x��^t�T7���<+le����y;��"�������%�l,Iv����|t�cG1���p���v��\��!��-�~AG���I��B[��;D�s]LQ[�P����6nE�=l���xN�
۠���%�S�����@��T��:�v���+�'�9KvS�tY�F\�lbp4���tِ�!\��t]W�@2�\/z�fX��Q����.�6烂�.bdϢ%3z�J����
�4��#��A�M}��J��9"����b��*���@���F���4�����)h(�5O���D)�ܝ�\K�+C��3M>//����cmf�^a��4��f~&z�K�
����N㖞�c��թ�*Lz��bN���R���w���<������ƊdQ�j:�;�����}�����2��4K�P)��>\NN��� K#��d���Z^�}��I�z�'K�'(i�4��&�/A?7g��C�ڦ�|׽�3>��9�~CףּL~��"�5Ц$�B3ݖ*�]Uk�_�������b{�u��AڜF"�ɖZ=���~�uf �~��<O%c:�?�ݩg�1����48�f�}\(��$rP2]�-�E�G��ic8��@��S`y�?�?UR�	�r���������R��b���7@�[�u�
{Q�m� �/����b斾!��	mx����:o��K߹���v��t�@�b��p�f�T��vTwt��f}6�GC$�L�ӵ��}P�1�~w���h:^�G8&�s4&��tJ]������j���o���v�G)��9O�������@�7�q*��4�a����~�m~�m�s��w�i�p�����jN�mM�6@`�ra^0���E�}�p��a�F������dS
�<aS�oW�������b@��a���J �#	HW����5����S�~����K߂�������6�H��Y��Q;�*��)�#-a���e`�q���*8���-�{�)Ws�+��=�H�vP�g���"3�e�?���6S��Y�_K���e�@�h�?�	�����)�8��z����bN�uЈ3�
����������"�!�٢�'g�7CO���U�,�� +� xSt����1�W�����z����4
'갰.�#�O4���xmz�;Ӭ	|��m������0��ţ��w.ѷXo�g=�o�0�Ό �-�d�.9�A|�q��^s"��2	�ʤ�x��$<	�j3ɂ��чX��>�m��<����8�3˰��]���#Jy�;7aBzM'�]���L��(&$U<F���裬;��^+�Y75����`�e�c$ ��7Y�������%<�PiQ@>@9#��K��<X���*�0�z���&���� u�o��f:T���YA�0Y����BU"�q�{92}�uӗ۞�+ �<�i���T5���0�ߒq��C���,�؍�K]ǀB����ֶ$�3��M�C~�G���z-\2c�E����QMnW��1(����c�\YiKȅu(�5�f?�ѹ��:\������#oF��r>�+�h�A�r��qx�}�E�8TeC7�g/�2�F ADHO�{�S��?������(�      A     x����j1���O�h�F���)�BK�Ӵ�ި�q�/��`?}�dG�(�զ���3sΑF������X����n�q��;�pa��nq��p&��ϟ�K@�:�ҊPUA�iŁ㍮W��"�4x�=�����*�N�퀹*F�8��q@���ŊF�jAK
FPd�2<�����v�T�ئ�#3I�("�KF�t��%���}yR&�ءaס}��)�,��O�9����ib��6�i��~���g���#�(���}����]~q���)��$� ���V$;�PUA2�AuA�i��'��,�����>}yݩ�ڔr�r�4|8'P��G�1����������x�=r��t�����.��]#�	,Ut�R�����T�$׸פ�`�X�3[~}wWʖ��x�(��,U���ދ��
��mU|�һ!���`��i����訂��܇�{��C��+9�S*��l�Ftm&O����a������Ň���ƃD�q(;	�bԔ���Z4����gp�z�4�_��      ?   e  x�Uұj�@�y��-��I:���Щ%PH;��$���=��+�N YL�;��_&�p��������p����YIE� J(�b��A�[��k�GH��sN��9���y:1N��(N��-^o�k�b���~�o|4�C�%%�y���8_¬����\�@��	 ��p$wer��=�K,D\fJT��t)��ow�2��5#�Sc )��,^n_j��z	RN�d�A��+�2�]7S��ج�c���h~��o��iw����L\��v�\�.���z�^�����ZVk
s)D��5��W��ݨ��P�l`�ƭ�kؕp:��?�v�g��d<_?��m{�ɖ ,8����ڪ��b�����~      I      x���M%��ׯO�c�@����9���R<��<=���*H�R���n�W���/���۽�wٿ�����||�s��lO�X���+Ʈ���F�8���#�0ҋ�'>�����9z�1����?f1��gΏ�c����쇹�vCǴ�w^x�:a���׍i�z��	�S��;�����f�]������1����u�r�=�����d@l7�'�6m�-��?�?~F�v����%�zY~�T{���Nk��:��{|�~|�����>���
Of J�f���6�Z��p^wT��\b6ׯ�	�Y*V�\�\a���hb~�7�i��0�9s�*"�r��������ٚ�B3~ %s}�>�?���
W#����ej�	x��CW�7>���������c�P�
[h��cc-�9�U�����X��m���BC+d��5�͹��f�n?�_����A��]g����|[+��?���s�F�s.T�Y��݅V�z��<���@��@�N6�O"J�3��*L����φ�ڍ��9���/T�Z�1��î8�R":zvgmb���9rs+H��6&qc4��^1�����4�d��d"��=��KPyh��>�pj�se��x����n����;�
@��
V�:�$� z��3s��䫭M�ŝ�k��MB���ȼ��I�XZ����h/�JY�(�k���CkhIW��3]:�<��z�Y��&f�aA���д���H-�4��A(������4Ƈl��nD}�"�Y�A״���ƺ�I-Z��(�Cˠi�W`qArV�"��L��	GJ%��V�΂"+~�����%g���>ʢ�f_�u��(-�`ur�guٌ�F�CW�2vH���1���N:�7�D�4	?E_���%����z��!�9��	^AR�B�;���")��:��{�زr�D-�}]Й�{U؊��o���6c��,�*�
F�$�;�98'i6uw��%s������3H�7Yv��b'��p,�ʼ�Ǯ
W%�B��*�]wa�'.يWU]4B\���w�sV�*�n��Í{7�!�}r�R[�ܡ�q��He6�F)�A�G��%�C/���q�R�1�l�"�r�R��2���D����L(G	*r���P��p�\�\�(*P���tD�u�6��Ҡ��S���.vF
V�ޓ�\Ԛ}}�LGټ�V����Uf���f�7y�v�T��H��+Ďd�FO�(���S��v���D�b�]��?���xn�/B��+�٥��2e�� �#M��ݥ�@����v�t�x����u�������6p�����i�f��r(�	�T9���K�eĊ-��j]�޷�.+�Ix�-�ƯHs욳\���
k/wLc�s�J��*%yl胔���)(��yG��(��s�O-��cM�>��I�VZ�SK�,'�bAk���))��"�jf�>AtQ���Z�S�ɡ��	20�eP��{�O�}�na[�f�Y� 9�T�bep�IὉpQY���\b��s���챔�),r(=4�6oD5�����0���"�d��cK�b�Yt;ٛR�d'-���5�I��r�A�t��q+l)��K���6�5��7�4�"u��!Mݏz�.�Z�Ȗ�JD9P;��,o�,����\�	�C���Nʝ+�F"�m:������j�����x��V���-��vsJQ*C���[k���j�.3�?�V������^���:����X�P��]P���flX�spmb�3�;D���4�zI[�^2i���7�<���L�Rxb��DI�m˹+x!]�2�43*!G�̿8��ǌ`Xm"�R��)�)N^�;��J���l=vm�=:O W�ND�^9um��_r�H�1��6�n*�^�@
lo��^��6z�>؇?�Z!��\80_�č҄-�	[�c�S�(,�#v�� ��F3+����KS�'Ά��e��*�7u�Q�
��F�_M�`���K��V�ʹ@ژ�Z��whQ
����*2y�F2�;��a�V�n2\�
 &�M��N�R�bax�#I�T���ΐ'3�٦0(��ڦ����R��x˫S��~�K&����`�4&��u86��
d�ޙ�K���N�JC^F3�Cz�!n�J�JȉK+B�*��
"�D�s�ʫ�ga�nOH�# sp��4�	����kg�(��\��n�J�;߸v#t��ܢ '�6x�l�+�yem�u��[��l'���<��|G^�Q���镦��ӈK���N��j�5��1�tڷ�7Lh:j�BH)5Jw��2-���=ht��E�cKC��D<�����xtP���љ�%,��_H��
�ҝ��֨�@kw�$˸(�y��y~z�n���Zif�ҡ�K���?U���30J�^U�����[C�w�j�Ҧ�5*�Al4�1���(�z�@R�2�����g&�^=;���M�q�_Z�P KvT�t *�ܛ/]�#���!���5r�K����e� Q~�0�wB8J�^q岃B^9.�?EFi֏=s�X�+J`�n��̤Q��y"��*6(&yj���K����a�蠭<�Z$7i��볢�aqt|�O���9�$��nѐ���~f�:����]a=I�������9i۟����n�3�5�����ⓙ�(��t��w��d	�G�b�C������+����)�M�>�f#O���JYE�݆X��F�ڽ�q@��ﹼ-J�32M������quH�K���NM�{U�� $V`߮2��x\Z�R�)C���}��Ö�'p����%�g7�SS&eK2O�l�GӨUv|M�Q��:4T��1爆SH'��F>�T���$�${>�ue���V�/N��XXv�3�Gi�k��$�n�$ �J�_��~>��_�uVmH��|��~���$��;�G%�;�����0e�؛\��fSg'�uT;�tr	�Qa�a����(=}^L�B�p(m��;��ti�v�V:q'�K�*�_�Q�j��tչ���P/�K]��?�@\!��79�}�)�K__�ݢl�����������W��~�vb�b��6뗞�Px�N�!�:*k������=�v�8�'��7��jUfiA��Tݖ$���ܯ9�������0�4շ+_���Uy��w�����T�4Y�ѵ��>���]�}(w�s,�Vi��P��4"Zz;]��̪�.�C�e��s����/$(9�l O�ơD}����ILyXF]���O�nR~���%���b�+���zRC�;W[��m	,��L�@��bpm����}0�X�_�O�.��	%S��Flo�>��C��:�9��|W:�٨ʼ�C�c��xY����m��Su�Ri��{i�Kg�l��R�����]��k�D�Gu����4��.���:����}���%ĺ�;�	��ͦ�3�;U��#�;&QEm+�%X��ϬtPs��:�������ѯw�y!B��w�E��_�堑+|�[5,͜����/���(@]�䣩<�H�l��/�'p��<��ͫ��7���+2��<5���\청�Cv����P��#�F���G���`���١�SV����%/
�q��Xm�9��գ�T��/,+;��4�UHi�/̷ֹ��	����V���O騳	����[I����e�,��0�m~�ȽXp='�>g��p�sad
�d��*�rt}�D�ʊ�u=�P�Mx(r�j��%�>�mM�'���v�e�(2u=�h߈��W���޾��F�A�J��Hv*[����R��*
S�MB�5��	����e�}�J�잯pF���� ��.���.r�J�_jO�ˊk��ٮ��u��ͨ�q����o�R훊$
3�&i&��ՕV��5���Rء��g.+w^�pb�_A|nb���5�N&h0���1��X9q/��"�p�C�d�)m����L5iPX���6s��.����M�K�x��gi�ga����%��]�j��*�e" Ȕ��ZP�9w�c<z�j>�D�Z���>�OǕZuTPW�qc�%h4��1Q��� �m!��zN�Rjɟ�X'&���㺬���'&� �  �w��?Պ�2W�А��ShX�G%�{"��z[m���Ty��F����;\���� ��=�S����wˤv��0��H�{�#8ta$kZ+�~��	n��=�sg�%.4��ө��eN�_5�����2_�F��UMz�Jݙ���i�gkp;]<�9�[�g��N���̄L:?����v�{�q�N�'Nj�|Ye�*y���ԉ����2�+y�^$��;����~VU��OwZ{�L�_b���Ǔ¼5t��yS@_o��_��?��;E�K[u������[���*]�x�hV{��+��ϓ�
c�r������>\�1Lv)��N;��.}�t�Z��^9W�q9��+�e>��]�)ItܬJ����]t(ك�ҳ�mK��Ŕ��y�l�M.�~���k]T�j��T�&�m~���љ�:��E��惕.�qj3���Ee��y�ꤺ[���4�KTH���#!��s�퉖��{�EvP�7/�Zi�goF� A�쫃�u��o�BXޖ�S��t�Jwe���͵�r~ϔ%]=#1�Y}2�4�N<�MW�2"����)/��t�pg@����-�H��C�f:[�j����ʠ�P&GS3�|��nڗC�%��p�2�a�n��ޫ������4'>�9�d0T�5��6)�ڕ:y<`u�Э��7;t6Y`�����ɟ�
�
�GR���%��l��0�Q�~�Z�����[-��J�}}���5�\v(�����Iٸ��j�5����ܐ����������|��DR�O�ZU��R�E_TX�OO6�����t�0��7�R�����~6�("����ԥ;{����[H�Q�(L7��z��(~�%�5�qսp����_��y�@����oAP]�wp����Q�v% c�z�갺�_-��p�@y ��8	��ߟYر=���m�=�X���r�F9S7�Ğ�$.!F����"����|W�+��Y�CV���`�N5
&��M��Y��i�})�I"�[k���-XC��B�a58�]���/hP�R֑cզ���/A��Z�լ��h�Z�~�][�#m��:�a�u3��z���������mW] G�/��p��Nw�;uo��8�op��<�vj�u�Kl,~�W��v~�D���c�<褖�y>��/��'Їwd��=��<����?=��x֝�XK�#���n������L��Ԭ�_�)�~��T�����.˕_���jy�ua�\�1�m�^Z�����#\�.G��}��n�xG�jNg�8������q��j0�v�L�۳��K��ɟ�5F5k4�8�t�n��󵘫�Zm�M�\�s���$��p����j:�9=��_�~���r�]���kW0���\*�gj�����z���s��4�K��z6�}�3q�{���}�n���K��UW
�(�K��*k>��6��O��)l���ϯ��>|1���P��닔��W����d�ٜȎ4\�����JS��Wa�ֈ�]^M�&0������n�����N��]��~�o��sm�E�k�_}��m}f�}������.t~w;�!m�K�|oG��v���!�Ha����/ߐ(�Lm\�t^4����C�0L4�s���?=g>g��}���eK��ݯ/h�u�aMmo=?�ׯ^ ��N�D��ni�<�����V��U#������͹K&�]Z�`��t�	弿|q�%cp:���15Qq���  6���X�u�S���2��:����`�����?��Ee��      C     x��ZYs�F~�ʂ���\yZŷ9.ˎk��e(����0C��� )����UvREq������x�E�ڄ�1S�r��Ps)���TGo�ƭ�n�~�o��Y�q�<�x�h�YT�&_��[5>߹��߮�n�y�,#�i6�;��W�ι6�j���������뼎~Q<~�2��Ǌ�J�h۸�U�7�;�^]$huX��[��]�p�qun��25�`JF��ܶ��k������2R�YX���K߸*w�k��֊�q��X2�EK|��}[����	�=d`���t����ܗ��G|;��vJr!T�3+����٘�Dv�4��ǟ��C���h���D��H�F�׫�U�ώn���0-g:���m���R6y�*�D0�H#m��U�O+���vm�6.~�w��}7�>S�c�|[nQ�}�`�Ώ,�����o�H�h)ׇ�?f ��V%�s�\s��n��߳0���4���~��c�Z��a�s�b���M���������|�|�����#̌DV�H8V��FN���ϖD�[���Z.�u��$�5:1ʨ5R��<;/JJ)��E���<]��-������q�D�X��j=�~�4�g,����o@t�ޏ�MR�[p�">��Z@���s�r �� ��!d!H��C�R�q�S�6����#�hx_�C6c!�~p�;`�ݗ��H-aJ��y�I�Dx6�G���K�Z�m�$#!���KW��m��6M%v������v�uS�[�.I;������xH ���.�LԵ�\ԛ��\!
��
�%`Ʒ~U�`���5�d�0�4j��[�R�'�,��7��Q��̶k�@��/�js� �����_m<��-q�~�!3�bk���$C$@8<��i��C(����_cD�K�:N������v�9�)��g0��7��Q�)����r����0D
\q�=o�p<`P4��@mG��Q���
�ھ��U�.�'�����j��u��R���|��3�t�Y����ø�륛a��r=�������᤭?����b���5�����"� �C��u���	o��P���PT�ŷi��������'�?�d���N%ʶr�u3J��������oQ�,�_L����}�o(�Z��x �!�X��(�b�r���46
g��F}��N1!�R�]��[��A�3���Ĥ�0h@�o�˳x�!�||���hB-��Z[�G�VD���HB�rѯ�1�,�	ՠ����ٔ.E�@�(��w519s�%��)��>*����D�D;��C�Sc4J��������s��$T"���`�I����o����g7,M �"j��K��3����7�&�?��ܭL�	V��I���l'N!h�I�Tuh�FB��u]�\󮨖k���Z8d�0�MN���O���,K��5����z
�,U2�`{��ݞ@%��Yg҈�:�"�!lM��Ͳ ra��r�`��7k�����B�Y�U7^�s�' d!�pk��\į��N)�8Kt>M�r��sk;�*�ϰN��6:�C�8��i��H����Pβ`xƿ]�2�E�ʋZJ�o�p��"M�.�_��,�����w�1�fI��86��T+�b�AG0o����,��w0����E��\��w��J&�䁩���漢����,�r xm\KW�>Ţ�
����)��`#L]����Q��IdMb�,\�N�	+�P�u����UIM���ڊXs�x�`�e0��d̠�7(���f�5_���t�s���F4���ZB����=����MWz����z����;EeG�������tʦѨ��\�ͯ/;<,�a���Չ�R�����nգa�ܽk/�.B���3t�T+���Bf�a+��bя�'�F��{$UGX�kwn���3MP	n�V��='M�
�T�e��}u�H��9p��Kjw��wnY4g��N�P�Q���\�s8���
X�c����	&�!ܾ�� 
���6��D�,a:�e��+_]VR��0^:AlP}��8E?�%t��B{F�;E�0�i���W���_��1A�K�߰h�8d�f*��?@A�]�pC�h�/�q�F���rZ���!,_�� �t��pE�s��f, �3+���~R����!8D�Q���'�-@�%M���Bp��_�j��qP�W��<2\���r-��v��g;`S!`�=��%X��C��������(`��$�z૲L�Ap�VYb�3�[��e!a��"|��q@����
UB��SBU!|�r��d��4JE�@`5��VT�����;��������d��@�����m�ǳ�����ǣ�LQ�n~�"]�[��=a�u���*�#�õE�	4��b&S3j�6S��!��`յ���+3�Ќ�l5��R�i�u��a�68wszI@����x�������,���)�:���V9��͏�<��tޚX�TF5vX�U[_�nJ�!������_6��&Fߐ�X[��J���m�5��T]t���e�zD�o(O�p��h�Ӑ�	:8t��a�ݐXOb1A��@[3�m�o�`o +j�7�`�@��HR�F@v�c~r75�r�C�E3�V��y��:~�������cB���7�׍S ԼB5�D[�S��x��	�����YL�̤ŧä�}j6ȅ	>m\YtG8��ޙ5�2���?�(�$�&��?h����p罡E�I��B[u8��7}�?�O���z�gl?����A� ����{�93�g"ؿWUW@�>��|��jW�-<?>)���⩊4Am�	Ӫ��f���E�wǧ#zXȔ�Y*,-�)���L'�&8g��|��UЫQf3��QI�=KU �'�CF�c,؜�g3l>�}e�� �|xr���	M�L���ޝ{��p��dfU��u羓&OCcC�}��5R}\;�,ZG�c:��C�����-�pt@��x�A3�1	�-���f�l*�6��6�<�r�BY<�$5�$����8DN�r�G|j�l�(p��i�ʊ\8�1�SAi<p�ES|�wN�b��/Y��oW�����?����a�N�l���;��6hφPM��|���u,Ӕ|��2U8�ҭݾ���͆��)hi8I/����܃����E�(��[w�g1�!�8'�5�O�F�Sa���i�ӷG`��tg�v�a�FO�,=�{�?�ZkG�Sgz�*6�q3���L�Фm"$R��[w�,0�\��������_b�6�L��x��I���� = ��0>�־|�|m4^&܈l|w����Q���?��l�_�9��     