--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.2 (Debian 11.2-1.pgdg100+1)

-- Started on 2019-03-10 15:32:51 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 24619)
-- Name: domain; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.domain (
    id integer NOT NULL,
    parent_domain_id integer,
    domain character varying(255) NOT NULL
);


ALTER TABLE public.domain OWNER TO "user";

--
-- TOC entry 199 (class 1259 OID 24638)
-- Name: domain_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.domain_id_seq OWNER TO "user";

--
-- TOC entry 197 (class 1259 OID 24626)
-- Name: domain_ip; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.domain_ip (
    domain_id integer NOT NULL,
    ip character varying(255) NOT NULL
);


ALTER TABLE public.domain_ip OWNER TO "user";

--
-- TOC entry 198 (class 1259 OID 24633)
-- Name: ip_address; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ip_address (
    ip character varying(255) NOT NULL
);


ALTER TABLE public.ip_address OWNER TO "user";

--
-- TOC entry 2904 (class 0 OID 24619)
-- Dependencies: 196
-- Data for Name: domain; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.domain (id, parent_domain_id, domain) FROM stdin;
1	\N	com
4	\N	net
5	\N	in
6	\N	ru
7	\N	jp
10	\N	tw
11	\N	ua
12	\N	mx
13	\N	kr
14	\N	za
15	\N	ar
16	\N	id
17	\N	au
18	\N	co
19	\N	sa
20	\N	hk
21	\N	tr
22	\N	gt
23	\N	nz
25	\N	org
35	\N	cn
36	\N	fr
37	\N	it
38	\N	de
42	\N	ca
44	\N	bid
48	\N	gr
51	\N	es
53	\N	no
54	\N	us
55	\N	tv
56	\N	ch
62	\N	az
2	1	tbcache.com
3	2	danuoyi.tbcache.com
8	1	facebook.com
9	3	com.danuoyi.tbcache.com
24	4	mydnspod.net
26	5	co.in
27	6	yandex.ru
28	1	jd.com
29	7	co.jp
30	1	sohu.com
31	8	ns.facebook.com
32	1	baidu.com
33	9	tmall.com.danuoyi.tbcache.com
34	1	yahoo.com
39	10	com.tw
40	11	com.ua
41	12	com.mx
43	13	co.kr
45	14	co.za
46	15	com.ar
47	16	co.id
49	17	com.au
50	18	com.co
52	1	espn.com
57	19	com.sa
58	20	com.hk
59	21	com.tr
60	22	com.gt
61	23	mega.nz
63	24	beian.mydnspod.net
64	1	google.com
65	1	linkedin.com
66	25	wikipedia.org
67	1	blogspot.com
68	26	google.co.in
69	27	ns1.yandex.ru
70	27	ns2.yandex.ru
71	28	ns1.jd.com
72	28	ns2.jd.com
73	28	ns3.jd.com
74	28	ns4.jd.com
75	29	google.co.jp
76	30	ns11.sohu.com
77	30	ns12.sohu.com
78	30	ns13.sohu.com
79	30	ns14.sohu.com
80	30	ns15.sohu.com
81	30	ns16.sohu.com
82	1	vk.com
83	1	reddit.com
84	1	taobao.com
85	1	amazon.com
86	31	b.ns.facebook.com
87	31	a.ns.facebook.com
88	32	dns.baidu.com
89	32	ns2.baidu.com
90	32	ns3.baidu.com
91	32	ns4.baidu.com
92	32	ns7.baidu.com
93	33	login.tmall.com.danuoyi.tbcache.com
94	1	youtube.com
95	1	qq.com
96	34	ns1.yahoo.com
97	34	ns2.yahoo.com
98	34	ns3.yahoo.com
99	34	ns4.yahoo.com
100	34	ns5.yahoo.com
101	1	twitter.com
102	1	xhamster.com
103	1	tmall.com
104	35	360.cn
105	1	pornhub.com
106	4	fbcdn.net
107	1	youm7.com
108	36	google.fr
109	1	bongacams.com
110	25	thepiratebay.org
111	1	snapdeal.com
112	1	livejasmin.com
113	37	google.it
114	38	google.de
115	1	xvideos.com
116	1	umeng.com
117	39	google.com.tw
118	40	google.com.ua
119	41	google.com.mx
120	1	bbc.com
121	4	slideshare.net
122	1	spotify.com
123	42	google.ca
124	43	google.co.kr
125	1	wtoip.com
126	4	pixnet.net
127	1	163.com
128	1	zoho.com
129	44	clearload.bid
130	1	youku.com
131	1	whatsapp.com
132	45	google.co.za
133	46	google.com.ar
134	47	google.co.id
135	1	booking.com
136	1	imgur.com
137	48	google.gr
138	1	taboola.com
139	49	google.com.au
140	50	google.com.co
141	1	chase.com
142	51	google.es
143	1	livedoor.com
144	1	tnaflix.com
145	35	google.cn
146	1	nextoptim.com
147	52	dns1.espn.com
148	52	dns2.espn.com
149	52	dns3.espn.com
150	52	dns5.espn.com
151	52	dns6.espn.com
152	53	google.no
153	36	amazon.fr
154	1	naver.com
155	54	zoom.us
156	1	1688.com
157	1	bukalapak.com
158	55	twitch.tv
159	56	google.ch
160	25	mozilla.org
161	1	diply.com
162	57	google.com.sa
163	1	albawabhnews.com
164	1	discordapp.com
165	1	ask.com
166	6	kissanime.ru
167	1	douyin.com
168	1	lifebuzz.com
169	58	google.com.hk
170	29	rakuten.co.jp
171	1	breitbart.com
172	59	google.com.tr
173	6	sberbank.ru
174	60	google.com.gt
175	61	nslu1.mega.nz
176	61	nslu2.mega.nz
177	61	nsnz1.mega.nz
178	61	nsnz2.mega.nz
179	1	ultimate-guitar.com
180	1	onlinesbi.com
181	25	wikimedia.org
182	1	hola.com
183	62	google.az
184	25	telegram.org
185	63	dnspod-vip4.beian.mydnspod.net
186	1	cbssports.com
187	4	fishki.net
188	4	reverso.net
189	1	alibabadns.com
192	\N	pe
193	\N	sg
194	\N	ph
196	\N	ve
197	1	ccgslb.com
198	\N	dk
199	\N	fi
200	1	softonic.com
202	\N	hu
204	1	wellsfargo.com
205	\N	dz
206	1	adp.com
208	\N	io
209	23	co.nz
210	\N	be
212	1	nike.com
213	\N	cz
214	35	com.cn
215	\N	to
218	\N	info
219	41	mercadolibre.com.mx
221	1	rotumal.com
222	1	cobalten.com
224	1	foxnews.com
225	1	okdiario.com
229	4	battle.net
230	1	patreon.com
231	1	theguardian.com
232	1	51sole.com
233	1	beeg.com
234	1	hp.com
237	1	theverge.com
238	1	homedepot.com
239	1	exoclick.com
244	1	porn555.com
246	1	9gag.com
247	4	themeforest.net
248	1	cl96rwprue.com
249	1	cnet.com
250	1	oracle.com
251	1	twimg.com
252	1	haber7.com
253	1	dictionary.com
254	25	4chan.org
257	25	zone-telechargement1.org
258	47	kaskus.co.id
259	1	dawn.com
260	1	newsprofin.com
261	55	zhanqi.tv
262	1	discover.com
263	1	mediafire.com
266	1	wiley.com
267	1	bilibili.com
268	1	pornq.com
269	6	seasonvar.ru
270	1	w3schools.com
272	1	siteadvisor.com
274	1	iperadventure.com
275	4	gmx.net
276	4	nhentai.net
277	1	baike.com
278	1	userapi.com
279	1	go.com
281	1	kooora.com
284	1	okta.com
285	4	speedtest.net
286	1	intuit.com
287	1	wowhead.com
288	1	gamersky.com
289	1	freearabsexx.com
291	4	ali213.net
292	1	hotels.com
294	1	mmoframes.com
295	1	hulu.com
296	1	android.com
297	4	behance.net
298	1	naukri.com
299	1	goodreads.com
300	1	godaddy.com
301	1	jf71qh5v14.com
302	1	yelp.com
303	1	pixabay.com
306	4	convert2mp3.net
307	1	thesaurus.com
314	1	mlb.com
315	1	friv.com
316	25	wiktionary.org
317	1	upwork.com
318	1	asus.com
320	1	googlevideo.com
321	7	blog.jp
322	1	samsung.com
323	1	dianping.com
324	1	wattpad.com
325	1	digitaldsp.com
326	1	cnnindonesia.com
327	1	indoxx1.com
329	1	alicdn.com
190	189	gds.alibabadns.com
191	190	com.gds.alibabadns.com
195	191	tmall.com.gds.alibabadns.com
201	192	com.pe
203	193	com.sg
207	194	com.ph
211	195	wagbridge.tmall.com.gds.alibabadns.com
216	196	co.ve
217	197	foreign.ccgslb.com
220	198	google.dk
223	199	google.fi
226	200	ns01.softonic.com
227	200	nse01.softonic.com
228	200	ns02.softonic.com
235	201	google.com.pe
236	202	google.hu
240	203	google.com.sg
241	204	nsa.wellsfargo.com
242	204	nsc.wellsfargo.com
243	204	nsx.wellsfargo.com
245	205	google.dz
255	206	dns2.adp.com
256	206	dns1.adp.com
264	207	google.com.ph
265	208	ouo.io
271	209	google.co.nz
273	210	google.be
280	211	sh.wagbridge.tmall.com.gds.alibabadns.com
282	212	nameserver-a.nike.com
283	212	nameserver-b.nike.com
290	213	seznam.cz
293	214	chinadaily.com.cn
304	215	cinecalidad.to
305	216	google.co.ve
308	217	webcache.foreign.ccgslb.com
309	197	ns1.ccgslb.com
310	197	ns3.ccgslb.com
311	197	ns4.ccgslb.com
312	197	ns5.ccgslb.com
313	197	ns6.ccgslb.com
319	214	autohome.com.cn
328	218	spotscenered.info
330	329	danuoyi.alicdn.com
331	1	wscdns.com
332	\N	pl
333	\N	ng
334	\N	uk
336	\N	me
338	\N	rs
339	35	k618.cn
340	\N	se
342	\N	ir
344	\N	biz
345	1	pandora.com
346	\N	nl
347	6	gismeteo.ru
348	\N	pt
349	1	ctrip.com
350	1	cisco.com
351	25	craigslist.org
352	1	alipay.com
353	29	yahoo.co.jp
354	1	amazonaws.com
355	35	amazon.cn
356	4	pixiv.net
359	\N	edu
362	1	cbsnews.com
363	1	s9kkremkr0.com
364	1	trulia.com
366	1	roblox.com
368	36	lefigaro.fr
369	1	okcupid.com
370	1	ibm.com
371	49	ebay.com.au
372	33	yao.tmall.com.danuoyi.tbcache.com
373	1	accuweather.com
375	1	hellomagazine.com
381	1	banggood.com
382	1	xiami.com
383	1	blatungo.com
386	1	freepik.com
387	1	mgid.com
388	1	bancodevenezuela.com
389	1	blackboard.com
393	1	shein.com
394	1	hespress.com
395	38	ebay-kleinanzeigen.de
396	1	elsevier.com
397	1	jianshu.com
398	1	quizlet.com
399	37	libero.it
400	1	toutiao.com
401	1	outbrain.com
402	1	canva.com
403	1	idntimes.com
406	1	ilovepdf.com
407	1	drudgereport.com
408	38	spiegel.de
409	35	firefoxchina.cn
410	1	getyesappz1.com
411	6	lenta.ru
416	1	prothomalo.com
417	4	popcash.net
418	1	webmd.com
419	1	forbes.com
420	25	cambridge.org
421	1	eksisozluk.com
422	1	pantip.com
424	1	unsplash.com
425	1	bet9ja.com
434	4	researchgate.net
438	1	eventbrite.com
439	1	hdzog.com
440	38	bild.de
445	1	tribunnews.com
446	4	2ch.net
447	1	douban.com
448	1	etsy.com
449	1	imdb.com
450	39	ltn.com.tw
451	1	xnxx.com
452	1	paypal.com
453	1	speakol.com
454	1	cnblogs.com
455	18	t.co
456	6	ok.ru
457	25	exhentai.org
458	1	wikihow.com
343	333	com.ng
459	1	wordpress.com
460	1	pinterest.com
461	33	detail.tmall.com.danuoyi.tbcache.com
462	1	aliexpress.com
463	55	dkn.tv
468	1	stackoverflow.com
478	1	pinimg.com
479	1	intel.com
480	58	discuss.com.hk
481	1	bet365.com
484	1	y8.com
485	1	crunchyroll.com
335	330	com.danuoyi.alicdn.com
337	331	com.wscdns.com
341	332	interia.pl
357	334	co.uk
358	335	tmall.com.danuoyi.alicdn.com
360	332	wp.pl
361	336	redwap.me
365	337	douyu.com.wscdns.com
367	332	google.pl
374	338	google.rs
376	339	ns4.k618.cn
377	339	ns3.k618.cn
378	339	ns5.k618.cn
379	339	ns1.k618.cn
380	339	ns2.k618.cn
384	340	google.se
385	341	ns.interia.pl
390	342	divar.ir
391	343	google.com.ng
392	344	flvto.biz
404	345	ns2.pandora.com
405	345	ns4.pandora.com
412	346	google.nl
413	347	ns17.gismeteo.ru
414	347	ns19.gismeteo.ru
415	347	ns20.gismeteo.ru
423	348	google.pt
426	349	ns1.ctrip.com
427	349	ns2.ctrip.com
428	349	ns3.ctrip.com
429	349	ns4.ctrip.com
430	349	ns5.ctrip.com
431	349	ns6.ctrip.com
432	349	ns7.ctrip.com
433	349	ns8.ctrip.com
435	350	ns1.cisco.com
436	350	ns2.cisco.com
437	350	ns3.cisco.com
441	351	ns1a.craigslist.org
442	351	ns2a.craigslist.org
443	351	ns1f.craigslist.org
444	351	ns2f.craigslist.org
464	352	ns1.alipay.com
465	352	ns2.alipay.com
466	352	ns3.alipay.com
467	352	ns4.alipay.com
469	353	ns01.yahoo.co.jp
470	353	ns02.yahoo.co.jp
471	353	ns11.yahoo.co.jp
472	353	ns12.yahoo.co.jp
473	354	r1.amazonaws.com
474	354	r2.amazonaws.com
475	354	u1.amazonaws.com
476	354	u2.amazonaws.com
477	355	u5.amazon.cn
482	356	ns1.pixiv.net
483	356	ns2.pixiv.net
486	357	bbc.co.uk
487	358	pages.tmall.com.danuoyi.alicdn.com
488	359	mit.edu
489	195	alibaba.tmall.com.gds.alibabadns.com
490	1	apple.com
491	\N	eg
492	\N	br
493	\N	pk
494	\N	ao
495	196	org.ve
496	25	archive.org
497	1	hao123.com
499	1	fedex.com
500	35	tianya.cn
501	359	stanford.edu
502	\N	ae
506	\N	ro
507	4	daum.net
508	7	ne.jp
511	6	mail.ru
512	1	usps.com
513	\N	best
515	1	wpengine.com
516	1	shopify.com
521	33	nianhuo.tmall.com.danuoyi.tbcache.com
522	1	messenger.com
523	18	openload.co
524	6	google.ru
528	1	aparat.com
529	33	buy.tmall.com.danuoyi.tbcache.com
534	1	hclips.com
535	1	onlinevideoconverter.com
536	1	bankofamerica.com
537	1	telewebion.com
538	4	csdn.net
539	4	popads.net
543	1	wordreference.com
544	1	detik.com
545	1	huanqiu.com
546	1	rt.com
498	489	wagbridge.alibaba.tmall.com.gds.alibabadns.com
503	490	ns.apple.com
504	491	com.eg
505	492	com.br
509	493	com.pk
510	494	co.ao
514	495	patria.org.ve
517	496	ns1.archive.org
518	496	ns2.archive.org
519	497	ns1.hao123.com
520	498	et15-et2-eu13-na61-na62.wagbridge.alibaba.tmall.com.gds.alibabadns.com
525	499	kate.fedex.com
526	499	land.fedex.com
527	499	grace.fedex.com
530	500	ns1.tianya.cn
556	1	bles.com
558	1	tokopedia.com
559	1	tumblr.com
560	42	amazon.ca
561	1	wix.com
562	35	mama.cn
564	1	webex.com
565	1	txxx.com
566	1	zhihu.com
567	357	google.co.uk
568	1	medium.com
569	215	rarbg.to
570	1	americanexpress.com
571	1	abs-cbn.com
572	1	evernote.com
573	1	ebay.com
574	1	coinmarketcap.com
575	1	squarespace.com
576	7	nicovideo.jp
577	18	tempo.co
578	1	zendesk.com
579	39	gamer.com.tw
580	1	salesforce.com
581	1	merdeka.com
585	1	bloomberg.com
586	1	varzesh3.com
588	38	amazon.de
589	1	360doc.com
590	1	kakaku.com
591	37	amazon.it
592	1	gamespot.com
593	1	businessinsider.com
594	1	runoob.com
597	1	udemy.com
598	357	amazon.co.uk
599	1	giphy.com
600	1	zippyshare.com
606	26	irctc.co.in
607	1	gizmodo.com
608	1	vimeo.com
609	1	soundcloud.com
610	214	pconline.com.cn
611	38	ebay.de
613	29	amazon.co.jp
614	16	uzone.id
615	1	cnbeta.com
616	1	indeed.com
617	1	xfinity.com
618	37	redd.it
621	25	wordpress.org
622	1	urbandictionary.com
623	1	scribd.com
624	5	amazon.in
625	4	taleo.net
627	1	ladbible.com
628	1	genius.com
629	35	youth.cn
531	500	ns2.tianya.cn
532	500	ns3.tianya.cn
533	500	ns4.tianya.cn
540	501	argus.stanford.edu
541	501	atalante.stanford.edu
542	501	avallone.stanford.edu
547	502	google.ae
548	503	a.ns.apple.com
549	503	b.ns.apple.com
550	503	c.ns.apple.com
551	503	d.ns.apple.com
552	503	e.ns.apple.com
553	503	f.ns.apple.com
554	490	nserver5.apple.com
555	490	nserver6.apple.com
557	504	google.com.eg
563	505	google.com.br
582	506	google.ro
583	507	ns1.daum.net
584	507	ns2.daum.net
587	508	hatena.ne.jp
595	509	google.com.pk
596	510	google.co.ao
601	511	ns2.mail.ru
602	511	ns1.mail.ru
603	511	ns3.mail.ru
604	512	dns141.usps.com
605	512	dns082.usps.com
612	513	egy.best
619	514	ns1.patria.org.ve
620	514	ns2.patria.org.ve
626	515	sopawfect.wpengine.com
630	1	aol.com
631	1	dell.com
632	\N	kw
633	1	capitalone.com
634	6	rambler.ru
635	1	ups.com
636	\N	site
638	1	ouedkniss.com
639	\N	online
640	\N	cc
641	\N	eu
642	\N	sexy
643	\N	si
646	1	ruliweb.com
647	\N	sh
648	\N	at
649	1	sindonews.com
650	1	okezone.com
651	1	springer.com
652	36	leboncoin.fr
653	336	line.me
654	1	youdao.com
655	1	sciencedirect.com
656	1	force.com
663	1	marca.com
664	51	amazon.es
665	1	espncricinfo.com
666	1	cricbuzz.com
671	1	bamilo.com
672	1	ikea.com
637	630	ns.aol.com
644	631	us.dell.com
645	632	com.kw
657	633	ns32gfe.capitalone.com
658	633	ns31gfe.capitalone.com
659	633	ns21gfe.capitalone.com
660	633	ns22gfe.capitalone.com
661	633	ns11gfe.capitalone.com
662	633	ns12gfe.capitalone.com
667	634	ns2.rambler.ru
668	634	ns3.rambler.ru
669	634	ns4.rambler.ru
670	634	ns5.rambler.ru
673	635	nsa.ups.com
674	635	nsb.ups.com
675	636	cryptobrowser.site
676	637	dns-01.ns.aol.com
677	637	dns-02.ns.aol.com
680	1	usatoday.com
681	1	ensonhaber.com
682	46	mercadolibre.com.ar
683	37	repubblica.it
684	1	nypost.com
685	6	kinopoisk.ru
686	1	thefreedictionary.com
687	1	walmart.com
688	1	bestbuy.com
691	1	flipkart.com
692	7	livedoor.jp
693	1	chess.com
694	1	instructure.com
695	1	elpais.com
697	1	weebly.com
698	1	huffingtonpost.com
699	1	redtube.com
700	1	asos.com
701	1	alibaba.com
702	4	doubleclick.net
703	1	primevideo.com
705	1	oath.com
706	1	citi.com
707	1	kapanlagi.com
710	1	mydrivers.com
711	336	blog.me
712	1	billdesk.com
713	1	fiverr.com
715	1	bitly.com
716	6	pikabu.ru
717	1	gyazo.com
718	1	pexels.com
725	1	avgle.com
726	1	engadget.com
727	1	autodesk.com
729	1	sonyliv.com
730	4	sourceforge.net
731	1	myway.com
732	1	miui.com
733	1	united.com
734	1	cnbc.com
735	1	target.com
736	1	playstation.com
737	1	copts-united.com
738	1	nexon.com
739	1	discogs.com
740	1	bldaily.com
741	1	ccleaner.com
742	1	alodokter.com
743	208	zimuzu.io
744	359	academia.edu
745	336	t.me
749	1	royalbank.com
750	1	nikkei.com
751	1	lifehacker.com
752	36	pole-emploi.fr
753	1	lenovo.com
754	1	surveymonkey.com
755	357	independent.co.uk
756	1	hm.com
757	38	web.de
758	1	asahi.com
759	1	ndtv.com
760	1	bestadbid.com
762	1	umblr.com
763	1	51cto.com
765	1	mynet.com
766	1	ninisite.com
769	1	wikia.com
770	1	dribbble.com
678	637	dns-06.ns.aol.com
679	637	dns-07.ns.aol.com
689	638	ns.ouedkniss.com
690	638	dns.ouedkniss.com
696	639	special-offers.online
704	640	ptt.cc
708	641	torrentz2.eu
709	642	yourporn.sexy
714	643	nyaa.si
719	644	ns1.us.dell.com
720	644	ns2.us.dell.com
721	644	ns3.us.dell.com
722	644	ns4.us.dell.com
723	644	ns5.us.dell.com
724	644	ns6.us.dell.com
728	645	google.com.kw
746	646	ns1.ruliweb.com
747	646	ns2.ruliweb.com
748	646	ns3.ruliweb.com
761	647	kissasian.sh
764	648	google.at
767	649	ns1.sindonews.com
768	649	ns2.sindonews.com
771	650	ns1.okezone.com
772	650	ns2.okezone.com
773	650	ns3.okezone.com
774	650	ns4.okezone.com
775	650	ns5.okezone.com
776	4	fastly.net
777	\N	il
778	\N	do
780	1	nvidia.com
781	1	4shared.com
782	20	tmall.hk
783	6	kp.ru
784	43	11st.co.kr
785	\N	sk
786	\N	am
787	\N	kz
788	1	fidelity.com
790	\N	systems
793	1	redfin.com
794	332	onet.pl
795	\N	cl
796	25	npr.org
797	7	weblio.jp
798	\N	is
799	\N	gov
800	\N	vn
801	38	mobile.de
802	\N	hr
803	\N	blue
804	1	stackexchange.com
807	1	so.com
779	776	ssl.fastly.net
789	777	co.il
791	778	com.do
792	779	global.ssl.fastly.net
805	780	azuredns1.nvidia.com
806	780	azuredns2.nvidia.com
808	781	ns3.4shared.com
809	781	ns4.4shared.com
812	1	badoo.com
821	1	jiameng.com
823	1	blogger.com
824	1	list-manage.com
825	1	ifeng.com
826	332	allegro.pl
828	39	104.com.tw
829	505	mercadolivre.com.br
830	6	ria.ru
832	1	subscene.com
836	1	dcinside.com
837	1	kizlarsoruyor.com
839	357	express.co.uk
840	1	zhaopin.com
842	37	ebay.it
844	1	att.com
845	1	namasha.com
846	1	best2018games.com
848	1	investing.com
850	1	groupon.com
851	1	expedia.com
852	1	hotmovs.com
853	1	as.com
854	1	appledaily.com
859	1	td.com
860	1	investopedia.com
865	1	shutterstock.com
866	25	rutracker.org
867	4	animeflv.net
868	1	zukxd6fkxqn.com
869	1	hubspot.com
879	1	tube8.com
880	25	e-hentai.org
881	1	xda-developers.com
883	1	bhphotovideo.com
884	357	ebay.co.uk
886	37	corriere.it
887	1	gsmarena.com
888	1	tistory.com
889	1	eyny.com
890	1	wunderground.com
891	6	hh.ru
892	1	uptobox.com
893	1	sportbible.com
894	459	files.wordpress.com
895	1	motherless.com
898	1	yaplakal.com
900	1	lifewire.com
901	1	uod2quk646.com
902	1	eskimi.com
903	1	nmisr.com
904	1	macys.com
905	1	humblebundle.com
906	1	artstation.com
907	1	ebates.com
908	4	linkshrink.net
909	1	lowes.com
910	36	lemonde.fr
911	1	airbnb.com
912	1	cdiscount.com
913	333	naija.ng
914	1	avg.com
915	41	debate.com.mx
916	1	gazetaexpress.com
917	55	hqq.tv
918	36	ebay.fr
919	1	cloudflare.com
920	1	wayfair.com
922	1	addthis.com
923	1	infobae.com
924	357	pinterest.co.uk
810	781	ns5.4shared.com
811	782	pilotsp.tmall.hk
813	783	ftp.kp.ru
814	783	ns1.kp.ru
815	783	ns2.kp.ru
816	783	ns3.kp.ru
817	783	ftp2.kp.ru
818	784	ns1.11st.co.kr
819	784	ns2.11st.co.kr
820	784	ns3.11st.co.kr
822	785	google.sk
827	786	yts.am
831	787	google.kz
833	788	fidns2.fidelity.com
834	788	fidns3.fidelity.com
835	788	fidns4.fidelity.com
838	789	google.co.il
841	790	browser-tools.systems
843	787	nur.kz
847	791	google.com.do
849	792	netplatform.global.ssl.fastly.net
855	793	ns1.redfin.com
856	793	ns2.redfin.com
857	793	ns3.redfin.com
858	793	ns4.redfin.com
861	794	dns.onet.pl
862	794	dns1.onet.pl
863	794	dns2.onet.pl
864	794	dns3.onet.pl
870	795	google.cl
871	796	holmes.npr.org
872	796	watson.npr.org
873	796	la-edns01.npr.org
874	797	ns1.weblio.jp
875	797	ns2.weblio.jp
876	797	ns3.weblio.jp
877	798	rarbg.is
878	795	tamilrockers.cl
882	799	state.gov
885	800	zing.vn
896	801	dns46-2.mobile.de
897	801	dns47-2.mobile.de
899	802	google.hr
921	803	torrent9.blue
925	\N	space
926	\N	tm
927	\N	iq
928	\N	ie
929	\N	tn
930	6	rbc.ru
931	\N	gg
932	6	drom.ru
933	4	rapidgator.net
934	1	aliyun.com
935	55	animeyt.tv
936	1	agoda.com
937	1	mathrubhumi.com
938	6	avito.ru
939	40	telegraf.com.ua
940	49	news.com.au
941	1	gotporn.com
942	1	gstatic.com
943	1	1fichier.com
944	1	usnews.com
945	208	codepen.io
946	4	inquirer.net
947	1	indiatimes.com
948	1	gearbest.com
949	340	fmovies.se
950	1	yt-adblocker.com
951	1	quizzstar.com
952	357	dailymail.co.uk
953	1	vporn.com
954	1	nature.com
955	51	elmundo.es
956	1	spankbang.com
957	1	dailycaller.com
959	42	kijiji.ca
960	1	ea.com
961	37	subito.it
962	6	gazeta.ru
963	1	instagram.com
964	1	sonyentertainmentnetwork.com
965	1	github.com
967	1	dropbox.com
968	1	prezi.com
969	6	4pda.ru
971	1	crptentry.com
972	1	zillow.com
973	1	lapatilla.com
974	1	usaa.com
975	1	deviantart.com
976	1	tripadvisor.com
977	1	quora.com
978	787	yandex.kz
979	11	olx.ua
980	1	duckduckgo.com
981	1	issuu.com
982	332	olx.pl
983	59	milliyet.com.tr
984	1	youporn.com
985	59	yandex.com.tr
986	1	nytimes.com
987	1	souq.com
989	1	steampowered.com
991	1	vidio.com
992	37	gazzetta.it
993	1	manoramaonline.com
996	4	atlassian.net
998	39	tvbs.com.tw
999	1	leagueoflegends.com
1002	1	weather.com
1003	1	delta.com
1004	1	verizonwireless.com
1005	1	ethfw0370q.com
1006	1	healthline.com
1007	1	dnckawxatc.com
1013	1	apkpure.com
1014	1	xtube.com
1015	4	5ch.net
1016	1	timeanddate.com
1017	1	beytoote.com
1018	357	telegraph.co.uk
1019	1	mileroticos.com
1020	11	prom.ua
1021	1	washingtonpost.com
1022	1	newegg.com
1023	1	grammarly.com
1024	1	basecamp.com
1025	1	epochtimes.com
1026	25	geeksforgeeks.org
1027	1	creditkarma.com
1031	4	uploaded.net
1032	1	reuters.com
1033	1	dmm.com
1034	25	dmv.org
1035	1	tomshardware.com
1036	1	chaturbate.com
1037	1	hepsiburada.com
1038	1	adobe.com
1039	1	gotomeeting.com
1040	1	buzzfeed.com
1041	1	concursolutions.com
1042	1	paytm.com
958	925	premium-offers.space
966	926	google.tm
970	927	google.iq
988	928	google.ie
990	929	google.tn
994	930	ns2.rbc.ru
995	930	ns3.rbc.ru
997	931	op.gg
1000	932	ns1.drom.ru
1001	932	ns2.drom.ru
1008	933	ns1.rapidgator.net
1009	933	ns2.rapidgator.net
1010	933	ns3.rapidgator.net
1011	933	ns4.rapidgator.net
1012	933	ns5.rapidgator.net
1028	934	ns3.aliyun.com
1029	934	ns4.aliyun.com
1030	934	ns5.aliyun.com
1043	4	yahoodns.net
1045	4	slickdeals.net
1046	\N	bg
1047	342	shaparak.ir
1048	1	sputniknews.com
1049	\N	lt
1050	1	lun.com
1051	800	com.vn
1052	508	goo.ne.jp
1053	1	southwest.com
1054	1	avast.com
1056	1	skysports.com
1057	1	slack.com
1058	1	strava.com
1059	1	trello.com
1060	1	smallpdf.com
1061	1	kumparan.com
1062	1	nfl.com
1063	1	gamepedia.com
1044	1043	b.yahoodns.net
1055	1044	gycs.b.yahoodns.net
1064	1045	ns7.slickdeals.net
1066	1	superuser.com
1067	1	y1jxiqds7v.com
1069	6	rutube.ru
1070	1	hootsuite.com
1071	1	dafont.com
1072	1	steamcommunity.com
1073	1	metropoles.com
1074	1	tomsguide.com
1075	1	westernjournal.com
1076	1	constantcontact.com
1077	35	mafengwo.cn
1078	1	getpocket.com
1079	1	dailymotion.com
1080	1	wondershare.com
1085	1	wetter.com
1086	1	el-nacional.com
1087	38	chip.de
1088	1	asana.com
1089	1	cimaclub.com
1092	1	nexusmods.com
1093	1	nordstrom.com
1094	1	so3ody.com
1095	1	cookpad.com
1096	1	xueqiu.com
1097	1	feedly.com
1098	1	norton.com
1099	4	vkuseraudio.net
1100	1	wetransfer.com
1101	1	tencent.com
1102	1	justdial.com
1103	1	kayak.com
1104	1	upornia.com
1105	1	mailchimp.com
1106	1	cam4.com
1107	1	ticketmaster.com
1108	1	urdupoint.com
1109	4	ccm.net
1110	1	goal.com
1111	1	mobile01.com
1112	4	savefrom.net
1113	1	mercari.com
1114	1	ancestry.com
1116	29	dmm.co.jp
1117	1	netflix.com
1118	1	duolingo.com
1123	1	vice.com
1124	1	wish.com
1125	1	cnn.com
1126	1	gfycat.com
1127	1	patch.com
1128	1	binance.com
1129	1	rediff.com
1130	1	epicgames.com
1131	1	box.com
1132	1	rottentomatoes.com
1133	1	wsj.com
1134	1	bandcamp.com
1135	1	flickr.com
1136	4	brilio.net
1138	1	udn.com
1139	1	kickstarter.com
1140	1	hatenablog.com
1141	1	fc2.com
1142	1	liputan6.com
1143	1	myfreecams.com
1144	4	vnexpress.net
1145	1	paytmmall.com
1146	25	sabq.org
1147	1	constintptr.com
1156	1	trustpilot.com
1157	59	sabah.com.tr
1158	1	ign.com
1159	1	xe.com
1161	1	v2ex.com
1065	1045	ns8.slickdeals.net
1068	1046	google.bg
1081	1047	ns1.shaparak.ir
1082	1047	ns2.shaparak.ir
1083	1047	ns3.shaparak.ir
1084	1047	ns4.shaparak.ir
1090	1048	ns7.sputniknews.com
1091	1048	ns8.sputniknews.com
1115	1049	google.lt
1119	1050	ns1.lun.com
1120	1050	ns2.lun.com
1121	1050	ns3.lun.com
1122	1050	ns4.lun.com
1137	1051	google.com.vn
1148	1052	ns1.goo.ne.jp
1149	1052	ns2.goo.ne.jp
1150	1053	ns-pdc.southwest.com
1151	1053	ns-sdc.southwest.com
1152	1054	ns2.avast.com
1153	1054	ns6.avast.com
1154	1054	pns.avast.com
1155	1054	sns.avast.com
1160	1055	edge2.gycs.b.yahoodns.net
1162	\N	th
1163	\N	ly
1164	492	gov.br
1165	1	oursec1.com
1166	\N	my
1167	1	sogou.com
1168	10	net.tw
1169	1	ourwebcdn.com
1170	7	naver.jp
1171	39	ruten.com.tw
1172	214	sina.com.cn
1173	1	huawei.com
1175	1	chron.com
1176	\N	sc
1177	1	xatyds.com
1178	\N	lk
1179	\N	rocks
1180	\N	games
1183	196	com.ve
1186	1	cctv.com
1188	1	hexun.com
1189	\N	ma
1190	505	uol.com.br
1191	1	china.com
1192	25	ieee.org
1194	641	europa.eu
1195	1	gfvip08ap.com
1196	\N	by
1197	1	suara.com
1198	776	map.fastly.net
1199	4	cqnews.net
1200	35	6.cn
1201	1	jomodns.com
1174	1162	co.th
1181	1163	com.ly
1182	1164	caixa.gov.br
1184	1165	attackd26.oursec1.com
1185	1166	com.my
1187	1167	proxy.sogou.com
1193	1168	ebc.net.tw
1205	4	myanimelist.net
1206	1	1bcde.com
1207	1	aa.com
1212	1	pornpics.com
1213	1	blizzard.com
1214	1	indiamart.com
1215	1	bleacherreport.com
1216	16	grid.id
1217	1	videojosmooth.com
1218	1	weibo.com
1219	25	khanacademy.org
1220	25	bitbucket.org
1221	6	drive2.ru
1222	1	filehippo.com
1223	214	china.com.cn
1233	25	archiveofourown.org
1234	1	58.com
1241	1	marketwatch.com
1242	505	olx.com.br
1243	1	tabelog.com
1244	1	costco.com
1245	505	reclameaqui.com.br
1246	35	weibo.cn
1247	1	baiducontent.com
1248	1	meetup.com
1249	1	iqiyi.com
1250	25	jw.org
1251	1	hotstar.com
1252	25	coursera.org
1253	505	americanas.com.br
1257	342	bankmellat.ir
1258	59	aksam.com.tr
1259	47	viva.co.id
1261	1	gmanetwork.com
1263	1	nextlnk1.com
1265	33	3c.tmall.com.danuoyi.tbcache.com
1266	25	ecosia.org
1272	1	smzdm.com
1279	1	2345.com
1280	214	caijing.com.cn
1293	33	nvzhuang.tmall.com.danuoyi.tbcache.com
1301	1	chinaz.com
1305	4	jb51.net
1306	214	zcool.com.cn
1313	4	secureserver.net
1316	795	biobiochile.cl
1317	1	4399.com
1322	1	xiaomi.com
1323	4	memurlar.net
1324	55	panda.tv
1325	1	babytree.com
1326	1	xinhuanet.com
1328	1	chiphell.com
1335	1	qihoo.com
1336	1	hotnewhiphop.com
1345	214	gome.com.cn
1346	640	zhibo8.cc
1347	1	farfetch.com
1349	1	pptv.com
1202	1169	xdwscache.ourwebcdn.com
1203	1170	ns1.naver.jp
1204	1170	ns2.naver.jp
1208	1171	ns1.ruten.com.tw
1209	1171	ns2.ruten.com.tw
1210	1171	ns3.ruten.com.tw
1254	1176	prnt.sc
1211	1171	ns4.ruten.com.tw
1224	1172	ns1.sina.com.cn
1225	1172	ns2.sina.com.cn
1226	1172	ns3.sina.com.cn
1227	1172	ns4.sina.com.cn
1228	1173	nsall.huawei.com
1229	1173	nsall3rd.huawei.com
1230	1173	nsall4th.huawei.com
1231	1173	nsallsec.huawei.com
1232	1174	google.co.th
1235	1175	ns1.chron.com
1236	1175	ns2.chron.com
1237	1175	ns3.chron.com
1238	1175	ns4.chron.com
1239	1175	ns5.chron.com
1240	1175	ns6.chron.com
1255	1177	cache.xatyds.com
1256	1178	google.lk
1260	1179	glorinlost.rocks
1262	1180	freeadult.games
1264	1181	google.com.ly
1267	1182	lyra.caixa.gov.br
1268	1182	mira.caixa.gov.br
1269	1182	orion.caixa.gov.br
1270	1182	polar.caixa.gov.br
1271	1183	mercadolibre.com.ve
1273	1184	1st.attackd26.oursec1.com
1274	1165	ns2.oursec1.com
1275	1165	ns3.oursec1.com
1276	1165	ns4.oursec1.com
1277	1165	ns1.oursec1.com
1278	1165	ns5.oursec1.com
1281	1185	google.com.my
1282	1186	ns1.cctv.com
1283	1186	ns2.cctv.com
1284	1186	ns4.cctv.com
1285	1186	ns5.cctv.com
1286	1187	e.proxy.sogou.com
1287	1167	ns2.sogou.com
1288	1167	ns1.sogou.com
1289	1188	ns.hexun.com
1290	1188	ns2.hexun.com
1291	1188	ns3.hexun.com
1292	1188	ns4.hexun.com
1294	1189	chouftv.ma
1295	1190	charles.uol.com.br
1296	1190	borges.uol.com.br
1297	1190	eliot.uol.com.br
1298	1191	ns1.china.com
1299	1191	ns-bgp.china.com
1300	1191	ns-bgp1.china.com
1302	1192	ns1.ieee.org
1303	1192	ns2.ieee.org
1304	1192	ns3.ieee.org
1307	1193	ns1.ebc.net.tw
1308	1193	ns2.ebc.net.tw
1309	1194	ns1bru.europa.eu
1310	1194	ns1lux.europa.eu
1311	1194	ns2bru.europa.eu
1312	1194	ns2lux.europa.eu
1314	1195	j37u6s5yxveg2u32.gfvip08ap.com
1315	1196	google.by
1318	1197	ns1.suara.com
1319	1197	ns2.suara.com
1320	1197	ns3.suara.com
1321	1197	ns4.suara.com
1327	1198	www-gov-uk.map.fastly.net
1329	1199	ns131.cqnews.net
1330	1199	ns174.cqnews.net
1331	1199	ns240.cqnews.net
1332	1200	ns1.6.cn
1333	1200	ns2.6.cn
1334	1200	ns3.6.cn
1337	1201	opencdn.jomodns.com
1338	1201	ns1.jomodns.com
1339	1201	ns2.jomodns.com
1340	1201	ns3.jomodns.com
1341	1201	ns4.jomodns.com
1342	1201	ns5.jomodns.com
1343	1201	ns6.jomodns.com
1344	1201	ns7.jomodns.com
1348	1202	suning.xdwscache.ourwebcdn.com
\.


--
-- TOC entry 2905 (class 0 OID 24626)
-- Dependencies: 197
-- Data for Name: domain_ip; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.domain_ip (domain_id, ip) FROM stdin;
8	31.13.72.36
27	77.88.55.66
27	5.255.255.60
27	77.88.55.60
27	5.255.255.55
28	111.13.28.118
28	120.52.148.118
30	221.179.177.36
30	220.181.90.52
30	123.125.116.28
32	123.125.115.110
32	220.181.57.216
34	98.137.246.8
34	98.138.219.231
34	72.30.35.9
34	98.138.219.232
34	72.30.35.10
34	98.137.246.7
52	199.181.132.250
61	31.216.148.10
61	89.44.169.135
64	172.217.17.78
65	108.174.10.10
66	91.198.174.192
67	172.217.17.73
68	172.217.17.67
69	213.180.193.1
70	93.158.134.1
71	111.13.28.10
72	111.206.226.10
73	120.52.149.254
74	106.39.177.32
75	172.217.17.67
76	111.202.126.2
77	220.181.20.2
78	103.239.204.103
79	103.239.204.104
80	125.254.154.167
81	125.254.154.168
82	87.240.129.71
82	87.240.129.133
82	87.240.180.136
82	87.240.182.224
83	151.101.193.140
83	151.101.65.140
83	151.101.1.140
83	151.101.129.140
84	140.205.94.189
84	140.205.220.96
85	176.32.103.205
85	205.251.242.103
85	176.32.98.166
86	69.171.255.12
87	69.171.239.12
88	202.108.22.220
89	61.135.165.235
90	220.181.37.10
91	220.181.38.10
92	180.76.76.92
93	188.254.86.254
94	172.217.17.78
95	111.161.64.48
95	111.161.64.40
96	68.180.131.16
97	68.142.255.16
98	203.84.221.53
99	98.138.11.157
100	119.160.253.83
101	104.244.42.65
101	104.244.42.129
102	88.208.18.30
102	88.208.29.24
103	140.205.94.193
103	140.205.130.99
104	36.110.213.49
105	216.18.168.16
106	31.13.72.36
107	104.17.98.21
107	104.17.99.21
108	172.217.17.67
109	216.18.168.1
110	104.27.216.28
110	104.27.217.28
111	103.194.153.149
111	103.194.152.149
112	109.71.161.200
113	172.217.17.67
114	172.217.17.67
115	185.88.181.9
115	185.88.181.10
115	185.88.181.11
115	185.88.181.2
115	185.88.181.3
115	185.88.181.4
115	185.88.181.5
115	185.88.181.6
115	185.88.181.7
115	185.88.181.8
116	123.57.253.206
117	172.217.17.67
118	172.217.17.67
119	172.217.17.67
120	151.101.64.81
120	151.101.0.81
120	151.101.128.81
120	151.101.192.81
121	108.174.10.19
122	104.154.127.47
122	104.199.64.136
122	104.199.240.211
123	172.217.17.67
124	172.217.17.67
125	118.178.113.110
126	103.23.108.107
127	123.58.180.8
127	123.58.180.7
128	8.39.54.155
129	172.64.175.2
129	172.64.174.2
130	106.11.47.20
131	184.173.147.38
131	169.44.84.178
131	184.173.147.39
131	169.44.82.102
131	192.155.212.203
131	192.155.212.202
132	172.217.17.67
133	172.217.17.67
134	172.217.17.67
135	5.57.16.220
136	151.101.12.193
137	172.217.17.67
138	107.22.178.157
139	172.217.17.67
140	172.217.17.67
141	159.53.42.11
141	159.53.113.168
141	159.53.85.137
141	159.53.84.126
141	159.53.116.62
141	159.53.44.60
141	159.53.224.21
142	172.217.17.67
143	203.104.153.16
144	77.247.179.176
145	172.217.17.67
146	107.178.250.249
147	192.234.2.11
148	192.234.2.12
149	74.123.203.97
150	74.123.200.193
151	208.85.64.193
152	172.217.17.67
153	52.95.120.39
153	52.95.116.113
153	54.239.33.91
154	210.89.160.88
154	125.209.222.141
154	210.89.164.90
154	125.209.222.142
155	192.204.15.223
156	42.156.140.12
156	140.205.174.2
157	103.64.14.21
157	103.64.14.17
157	103.64.14.20
157	103.64.14.18
158	151.101.194.167
158	151.101.2.167
158	151.101.130.167
158	151.101.66.167
159	172.217.17.67
160	63.245.208.195
161	23.212.232.182
162	172.217.17.67
163	172.64.199.3
163	172.64.198.3
164	104.16.59.5
164	104.16.58.5
165	104.108.55.123
166	104.20.26.43
166	104.20.27.43
167	122.14.229.8
168	104.20.9.153
168	104.20.10.153
169	172.217.17.67
170	133.237.61.176
171	35.241.35.213
172	172.217.17.67
173	194.54.14.159
174	172.217.17.67
175	31.216.148.11
176	31.216.148.13
177	103.244.183.5
178	122.56.56.216
179	178.18.22.152
180	103.68.220.61
181	91.198.174.192
182	62.22.171.50
183	172.217.17.68
184	149.154.167.99
185	203.195.147.223
185	115.159.159.215
186	216.239.116.100
187	88.212.236.84
187	88.212.236.76
188	89.107.171.183
200	35.233.114.27
204	159.45.2.143
204	159.45.170.143
204	159.45.66.143
206	170.146.93.56
212	146.197.184.71
219	216.33.197.84
219	209.225.49.84
220	172.217.17.67
221	188.72.213.220
221	188.72.213.221
222	188.72.213.175
222	188.42.162.184
222	188.42.162.170
222	188.72.213.176
223	172.217.17.67
224	23.0.43.238
225	185.47.12.153
225	185.104.133.10
225	185.47.12.150
225	185.104.133.9
225	185.104.133.8
225	185.47.12.155
225	185.47.12.151
225	185.104.133.11
226	46.28.208.141
227	69.64.59.58
228	46.28.208.142
229	24.105.29.30
230	104.20.18.183
230	104.20.19.183
231	151.101.1.111
231	151.101.65.111
231	151.101.129.111
231	151.101.193.111
232	47.90.2.56
233	104.20.38.253
233	104.20.37.253
234	15.72.228.83
234	15.73.104.147
234	15.73.192.108
234	15.72.164.74
235	172.217.17.67
236	172.217.17.67
237	151.101.65.52
237	151.101.1.52
237	151.101.129.52
237	151.101.193.52
238	35.201.95.83
239	94.23.144.230
240	172.217.17.67
241	159.45.75.60
242	159.45.5.52
243	209.112.113.33
244	104.27.20.101
244	104.27.21.101
245	172.217.17.67
246	151.101.130.133
246	151.101.194.133
246	151.101.66.133
246	151.101.2.133
247	104.18.31.233
247	104.18.30.233
248	198.134.112.244
248	198.134.112.241
248	198.134.112.243
248	198.134.112.242
249	64.30.228.118
250	137.254.120.50
251	210.163.219.24
252	185.195.230.7
253	23.0.213.133
254	104.16.119.221
254	104.16.117.221
254	104.16.116.221
254	104.16.120.221
254	104.16.118.221
255	170.146.146.170
256	170.146.170.146
257	104.25.120.112
257	104.25.119.112
258	103.6.117.2
258	103.6.117.3
259	104.20.9.120
259	104.20.10.120
260	172.64.193.4
260	172.64.192.4
261	182.92.104.151
262	72.246.101.19
263	104.19.194.29
263	104.19.195.29
264	172.217.17.67
265	104.20.2.139
265	104.20.1.139
266	209.172.193.49
267	61.244.33.163
268	104.24.13.115
268	104.24.14.115
269	178.236.137.57
269	178.236.137.118
269	178.236.137.154
269	178.236.137.156
269	178.236.137.157
270	66.29.212.110
271	172.217.17.67
272	161.69.17.94
272	161.69.25.181
273	172.217.17.67
274	95.216.86.133
275	82.165.229.87
276	141.101.120.54
276	141.101.120.55
277	124.243.228.136
278	95.213.4.234
279	23.236.60.174
280	140.205.164.45
281	107.154.102.19
281	107.154.103.19
282	156.53.53.53
283	156.53.53.54
284	23.21.220.245
285	151.101.2.219
285	151.101.130.219
285	151.101.194.219
285	151.101.66.219
286	104.103.202.62
287	192.33.31.183
288	222.223.239.125
289	104.25.101.106
289	104.25.102.106
290	77.75.77.39
291	60.12.149.194
292	104.111.245.34
293	124.127.180.200
294	172.64.140.7
294	172.64.141.7
295	72.246.146.30
296	172.217.17.68
297	151.101.129.197
297	151.101.193.197
297	151.101.1.197
297	151.101.65.197
298	54.251.103.25
298	54.251.99.37
299	52.94.226.87
299	52.94.237.126
299	54.239.26.220
300	104.238.65.160
300	208.109.192.70
301	198.134.112.244
301	198.134.112.241
301	198.134.112.242
301	198.134.112.243
302	151.101.36.116
303	213.239.228.132
303	213.239.228.130
304	172.64.135.5
304	172.64.134.5
305	172.217.17.67
306	104.27.120.50
306	104.27.121.50
307	2.22.111.12
308	106.48.12.36
308	106.48.12.102
309	106.48.14.68
310	106.48.14.64
311	106.48.12.68
312	119.188.140.75
313	122.228.86.69
314	209.102.213.14
315	192.64.119.83
316	91.198.174.192
317	104.16.33.27
317	104.16.32.27
318	103.10.4.216
319	124.250.78.6
320	172.217.17.68
321	125.6.146.13
322	211.45.27.231
323	203.76.216.1
324	104.16.111.12
324	104.16.108.12
324	104.16.109.12
324	104.16.107.12
324	104.16.110.12
325	173.0.146.147
325	173.0.146.10
325	173.0.146.148
326	103.49.221.130
326	203.190.242.254
327	104.25.6.27
327	104.25.7.27
328	104.17.60.91
328	104.17.59.91
328	104.17.58.91
328	104.17.57.91
328	104.17.61.91
329	140.205.77.240
329	115.238.23.240
339	123.103.56.42
341	217.74.65.23
345	208.85.40.20
345	208.85.40.50
347	185.134.201.6
347	185.134.202.6
347	185.134.202.5
347	185.134.201.245
347	185.134.201.5
349	140.207.228.45
350	72.163.4.185
351	208.82.237.226
352	110.75.129.5
352	110.75.139.5
353	182.22.59.229
353	183.79.135.206
354	72.21.206.80
354	207.171.166.22
354	72.21.210.29
355	54.222.60.218
356	210.129.120.45
356	210.129.120.56
356	210.129.120.49
360	212.77.98.9
361	104.25.66.16
361	104.25.67.16
362	64.30.228.126
363	198.134.112.242
363	198.134.112.244
363	198.134.112.243
363	198.134.112.241
364	198.176.43.184
365	87.245.198.78
366	69.172.201.47
367	172.217.17.67
368	212.95.74.42
369	198.41.209.131
369	198.41.209.133
369	198.41.208.132
369	198.41.208.133
369	198.41.209.132
370	129.42.38.10
371	66.211.181.20
371	66.135.211.132
371	66.211.185.77
371	66.135.201.153
371	66.211.181.235
372	188.254.86.252
373	207.242.93.24
374	172.217.17.67
375	62.22.15.85
376	113.5.80.47
377	111.202.83.249
378	14.18.201.112
379	45.124.126.179
380	60.220.194.228
381	169.48.161.43
382	106.11.248.153
383	104.24.9.73
383	104.24.8.73
384	172.217.17.67
385	217.74.65.131
386	178.33.44.27
387	64.58.116.132
388	200.44.45.12
389	69.164.39.141
390	79.175.141.111
390	79.175.141.112
390	79.175.141.110
391	172.217.17.67
392	94.130.238.226
393	173.192.129.99
393	173.192.129.101
393	173.192.129.102
393	173.192.129.100
393	173.192.129.103
394	104.20.114.3
394	104.20.115.3
395	194.50.69.193
395	91.211.75.196
396	185.64.253.1
397	107.150.101.156
398	104.16.15.221
398	104.16.16.221
398	104.16.18.221
398	104.16.17.221
398	104.16.14.221
399	213.209.17.209
400	123.58.9.80
401	50.31.185.52
401	64.74.232.52
402	104.16.79.22
402	104.16.77.22
402	104.16.78.22
402	104.16.80.22
402	104.16.81.22
403	103.5.51.124
403	103.5.51.123
404	199.116.165.40
405	199.116.165.20
406	104.20.0.94
406	104.20.1.94
407	35.241.54.163
408	128.65.210.8
409	211.151.213.244
410	96.45.83.233
410	96.45.82.193
410	96.45.83.113
410	96.45.82.26
411	81.19.72.37
411	81.19.72.36
411	81.19.72.34
411	81.19.72.35
411	81.19.72.38
411	81.19.72.39
412	172.217.17.67
413	37.233.84.12
414	130.193.66.229
415	92.242.43.211
416	107.154.247.36
416	107.154.248.36
417	104.20.129.46
417	104.20.128.46
418	208.93.170.15
419	151.101.2.49
419	151.101.130.49
419	151.101.66.49
419	151.101.194.49
420	185.26.230.129
421	176.53.43.5
421	176.53.43.3
421	176.53.43.4
421	176.53.43.9
421	176.53.43.7
421	176.53.43.11
421	176.53.43.10
421	176.53.43.8
421	176.53.43.2
421	176.53.43.6
422	103.77.118.135
422	103.77.118.136
423	172.217.17.67
424	151.101.193.181
424	151.101.65.181
424	151.101.1.181
424	151.101.129.181
425	185.179.62.2
426	210.13.114.42
427	140.206.211.7
428	210.13.114.44
429	114.80.10.7
430	101.226.248.130
431	101.226.248.131
432	140.207.228.14
433	140.207.228.15
434	65.39.251.71
434	65.39.251.72
434	65.39.251.69
434	65.39.251.70
435	72.163.5.201
436	64.102.255.44
437	173.37.146.41
438	34.202.46.121
438	34.197.148.4
438	34.204.250.133
438	34.224.9.38
438	34.205.126.7
438	34.195.82.122
438	34.203.51.197
438	34.203.126.169
439	104.24.4.33
439	104.24.5.33
440	145.243.240.20
440	145.243.248.20
441	208.82.237.71
442	208.82.237.72
443	208.82.238.71
444	208.82.238.72
445	180.240.134.85
446	104.20.49.205
446	104.20.50.205
447	154.8.131.172
447	154.8.131.165
447	154.8.131.171
448	151.101.193.224
448	151.101.65.224
448	151.101.129.224
448	151.101.1.224
449	52.94.225.248
449	52.94.228.167
449	52.94.237.74
450	218.211.33.75
451	185.88.181.53
451	185.88.181.54
451	185.88.181.55
451	185.88.181.56
451	185.88.181.57
451	185.88.181.58
451	185.88.181.59
451	185.88.181.60
452	64.4.250.33
452	64.4.250.32
453	104.25.72.110
453	104.25.71.110
454	42.121.252.58
455	104.244.42.197
455	104.244.42.133
455	104.244.42.5
455	104.244.42.69
456	217.20.155.13
456	5.61.23.11
456	217.20.147.1
457	109.236.92.143
457	109.236.92.166
457	217.23.13.45
457	217.23.13.91
457	109.236.84.145
457	109.236.84.136
458	151.101.202.110
459	192.0.78.9
459	192.0.78.17
460	151.101.0.84
460	151.101.64.84
460	151.101.128.84
460	151.101.192.84
461	121.42.17.239
461	121.42.17.238
462	198.11.132.250
463	104.17.201.68
463	104.17.200.68
463	104.17.197.68
463	104.17.199.68
463	104.17.198.68
464	110.75.240.29
464	45.113.40.61
465	110.76.21.66
466	110.76.21.88
467	45.113.40.93
467	110.75.232.61
468	151.101.1.69
468	151.101.65.69
468	151.101.129.69
468	151.101.193.69
469	118.151.254.133
470	118.151.254.149
471	124.83.255.37
472	124.83.255.101
473	205.251.192.27
474	205.251.195.199
475	156.154.64.10
476	156.154.65.10
477	156.154.68.10
478	151.101.64.84
478	151.101.0.84
478	151.101.128.84
478	151.101.192.84
479	13.91.95.74
480	104.20.171.49
480	104.20.170.49
481	5.226.176.16
482	210.129.120.60
483	210.129.120.62
484	95.85.28.135
484	95.85.39.215
485	104.20.19.239
485	104.20.18.239
486	151.101.0.81
486	151.101.192.81
486	151.101.64.81
486	151.101.128.81
487	188.254.86.254
488	23.66.16.128
490	17.172.224.47
490	17.142.160.59
490	17.178.96.59
496	207.241.224.2
497	123.125.114.5
497	180.149.132.3
497	220.181.163.1
497	61.135.162.10
499	204.135.13.50
499	204.135.13.155
499	204.135.13.175
499	204.135.8.175
499	204.135.8.155
499	204.135.8.50
500	124.225.65.154
501	171.67.215.200
507	203.133.167.81
507	203.133.167.16
507	211.231.99.17
507	211.231.99.80
511	217.69.139.201
511	94.100.180.200
511	94.100.180.201
511	217.69.139.200
512	56.0.134.100
514	190.205.112.69
514	190.205.112.68
516	34.235.254.128
516	52.3.14.103
516	54.165.90.249
517	208.70.31.236
518	208.70.31.251
519	180.76.1.26
520	140.205.35.14
521	188.254.86.254
522	31.13.72.8
523	104.16.168.50
523	104.16.167.50
523	104.16.165.50
523	104.16.164.50
523	104.16.166.50
524	172.217.17.67
525	199.81.212.13
526	204.135.12.100
527	199.81.217.100
528	185.147.178.13
528	185.147.178.14
528	185.147.178.12
528	185.147.178.11
529	123.53.182.233
529	123.53.182.232
530	218.77.130.10
531	221.11.172.10
532	124.225.214.10
533	113.59.107.10
534	104.23.105.173
534	104.23.104.173
535	94.228.214.149
536	171.159.228.150
536	171.161.148.150
537	46.28.53.115
538	47.95.164.112
539	216.21.13.12
539	216.21.13.13
540	171.64.7.115
541	171.64.7.61
542	204.63.227.77
543	148.251.23.152
544	203.190.242.211
544	103.49.221.211
545	119.254.147.230
545	119.254.147.247
546	103.5.149.90
546	103.5.149.91
547	172.217.17.67
548	17.253.200.1
549	17.253.207.1
550	204.19.119.1
551	204.26.57.1
552	208.78.70.129
553	204.13.250.129
554	17.171.63.30
555	17.171.63.40
556	104.18.72.52
556	104.18.73.52
556	104.18.75.52
556	104.18.76.52
556	104.18.74.52
557	172.217.17.67
558	47.74.234.244
559	66.6.33.31
559	66.6.32.31
559	66.6.33.159
560	52.94.225.242
560	54.239.18.172
560	54.239.19.238
561	185.230.60.164
561	185.230.61.164
562	119.145.147.177
563	172.217.17.67
564	64.68.121.205
565	104.20.71.110
565	104.20.72.110
566	118.89.204.109
566	118.89.204.100
566	118.89.204.190
567	172.217.17.67
568	104.16.123.127
568	104.16.122.127
568	104.16.124.127
568	104.16.121.127
568	104.16.120.127
569	185.37.100.122
570	104.82.246.170
571	104.16.117.25
571	104.16.118.25
572	35.190.29.187
573	66.135.216.190
573	66.135.209.52
573	66.211.181.123
573	66.211.185.25
573	66.211.160.86
573	66.211.162.12
574	104.17.141.178
574	104.17.138.178
574	104.17.137.178
574	104.17.139.178
574	104.17.140.178
575	198.185.159.176
575	198.185.159.177
575	198.49.23.176
575	198.49.23.177
576	202.248.110.184
577	13.251.82.126
577	13.251.168.238
578	192.161.154.1
579	104.17.127.66
579	104.17.128.66
579	104.17.129.66
579	104.17.131.66
579	104.17.130.66
580	96.43.148.26
580	96.43.149.26
581	103.6.0.2
581	103.6.0.3
581	103.6.0.15
582	172.217.17.67
583	113.61.106.5
584	113.61.107.5
585	69.187.23.20
585	69.191.252.148
586	94.182.163.52
586	94.182.163.51
587	59.106.194.19
588	54.239.39.102
588	52.95.120.34
588	176.32.108.185
589	39.106.173.98
589	47.93.194.183
590	210.129.151.129
591	52.95.116.114
591	52.95.120.36
591	54.239.33.83
592	64.30.228.81
593	151.101.64.64
593	151.101.192.64
593	151.101.0.64
593	151.101.128.64
594	42.156.141.17
595	172.217.17.67
596	172.217.17.67
597	104.18.130.108
597	104.18.132.108
597	104.18.131.108
597	104.18.133.108
597	104.18.134.108
598	54.239.34.171
598	178.236.7.220
598	54.239.33.58
599	151.101.193.185
599	151.101.129.185
599	151.101.1.185
599	151.101.65.185
600	145.239.9.15
601	94.100.180.138
602	217.69.139.112
603	185.30.176.202
604	56.0.141.25
605	56.0.82.25
606	103.252.142.19
606	103.252.142.21
606	103.252.142.18
607	151.101.66.166
607	151.101.130.166
607	151.101.2.166
607	151.101.194.166
608	151.101.192.217
608	151.101.0.217
608	151.101.128.217
608	151.101.64.217
609	52.85.252.215
609	52.85.252.191
609	52.85.252.152
609	52.85.252.151
610	219.136.245.40
611	66.135.211.132
611	66.211.181.20
611	66.211.185.77
611	66.211.181.235
611	66.135.201.153
612	104.25.237.22
612	104.25.236.22
613	52.119.164.121
613	52.119.161.5
613	52.119.168.48
614	36.86.63.186
615	125.90.93.20
616	169.45.207.192
617	96.114.14.140
617	68.87.41.40
617	96.114.21.40
618	151.101.1.140
618	151.101.65.140
618	151.101.193.140
618	151.101.129.140
619	200.44.167.4
620	200.44.167.5
621	198.143.164.252
622	151.101.192.207
622	151.101.128.207
622	151.101.64.207
622	151.101.0.207
623	151.101.0.175
623	151.101.128.175
623	151.101.64.175
623	151.101.192.175
624	52.95.116.115
624	52.95.120.67
624	54.239.33.92
625	68.233.77.233
626	104.196.156.152
627	104.16.2.248
627	104.16.5.248
627	104.16.3.248
627	104.16.1.248
627	104.16.4.248
628	104.16.213.100
628	104.16.210.100
628	104.16.212.100
628	104.16.211.100
628	104.16.209.100
629	123.103.5.94
630	66.218.87.12
630	106.10.218.150
630	67.195.231.10
630	188.125.72.165
630	124.108.115.87
631	143.166.135.105
631	143.166.147.101
633	208.80.48.175
633	204.63.46.18
634	81.19.82.10
634	81.19.82.11
634	81.19.82.8
634	81.19.82.9
635	153.2.224.50
635	153.2.228.50
638	51.255.67.74
638	37.187.137.67
638	149.202.206.99
646	103.24.8.4
649	182.253.240.18
650	202.80.220.218
650	202.80.220.213
651	195.128.8.134
652	193.164.196.82
652	193.164.197.82
653	203.104.138.138
654	61.135.218.27
654	61.135.218.30
655	198.81.200.2
656	204.74.99.100
657	204.63.46.161
658	204.63.46.160
659	208.66.216.160
660	208.66.216.161
661	208.80.48.160
662	208.80.48.161
663	193.110.128.82
664	52.95.120.38
664	52.95.116.112
664	54.239.33.90
665	52.19.167.6
666	161.202.24.162
666	119.81.119.5
667	81.19.73.8
668	81.19.83.8
669	81.19.73.9
670	81.19.83.9
671	104.17.203.121
671	104.17.206.121
671	104.17.202.121
671	104.17.205.121
671	104.17.204.121
672	216.87.148.114
673	153.2.242.115
674	153.2.244.155
675	104.25.211.116
675	104.25.212.116
676	64.12.51.132
677	205.188.157.232
678	207.200.73.80
679	64.236.1.107
680	159.54.242.176
681	104.20.59.198
681	104.20.60.198
682	216.33.197.78
682	209.225.49.78
683	213.92.16.101
684	192.0.79.33
684	192.0.79.32
685	87.250.251.105
685	213.180.193.105
686	209.40.98.46
687	161.170.230.170
687	161.170.239.170
687	161.170.232.170
688	72.246.101.185
689	46.105.50.248
690	46.105.50.248
691	163.53.78.128
692	203.104.153.16
693	68.71.245.5
694	54.165.95.219
694	54.191.191.127
695	92.122.206.69
695	92.122.206.83
696	95.211.7.132
697	74.115.50.110
697	74.115.50.109
698	98.136.103.26
698	124.108.115.103
698	212.82.100.153
698	74.6.136.153
698	106.10.248.153
699	216.18.168.124
700	2.16.84.207
701	198.11.132.23
701	205.204.101.42
702	172.217.17.78
703	52.85.201.207
704	140.112.172.3
704	140.112.172.4
704	140.112.172.1
704	140.112.172.5
704	140.112.172.2
704	140.112.172.11
705	106.10.248.153
705	212.82.100.153
705	124.108.115.103
705	74.6.136.153
705	98.136.103.26
706	192.193.218.80
706	192.193.102.176
707	203.12.21.11
707	203.12.21.5
708	104.31.70.87
708	104.31.71.87
709	80.82.77.69
710	123.206.6.193
711	125.209.214.79
712	210.210.24.66
713	104.16.55.215
713	104.16.52.215
713	104.16.54.215
713	104.16.56.215
713	104.16.53.215
714	192.124.249.158
715	67.199.248.14
715	67.199.248.15
716	212.224.112.193
716	91.228.155.94
716	91.228.155.121
717	35.186.213.112
718	104.16.242.112
718	104.16.241.112
718	104.16.239.112
718	104.16.238.112
718	104.16.240.112
719	143.166.82.251
720	143.166.82.252
721	143.166.224.3
722	143.166.224.11
723	143.166.83.13
724	143.166.224.235
725	104.20.68.102
725	104.20.69.102
726	67.195.231.10
726	106.10.218.150
726	188.125.72.165
726	66.218.87.12
726	124.108.115.87
727	132.188.92.132
728	172.217.17.67
729	52.77.194.240
730	216.105.38.13
731	74.113.233.77
732	124.243.204.202
733	23.214.153.51
734	144.121.138.34
734	144.121.138.33
735	161.225.203.239
736	209.200.152.198
737	194.150.248.33
738	183.110.0.151
738	183.110.0.23
739	216.151.17.130
740	104.18.67.52
740	104.18.71.52
740	104.18.68.52
740	104.18.70.52
740	104.18.69.52
741	151.101.66.202
741	151.101.2.202
741	151.101.130.202
741	151.101.194.202
742	104.24.30.48
742	104.24.31.48
743	47.52.174.174
743	47.52.153.161
744	54.247.118.82
745	149.154.167.99
746	103.24.8.11
747	103.24.8.20
748	103.24.8.10
749	216.87.148.114
750	138.101.9.100
751	151.101.2.166
751	151.101.66.166
751	151.101.130.166
751	151.101.194.166
752	109.26.209.20
753	2.17.233.115
754	64.191.16.50
755	151.101.129.184
755	151.101.65.184
755	151.101.1.184
755	151.101.193.184
756	104.86.110.19
756	104.86.110.41
757	82.165.229.138
757	82.165.230.17
758	104.103.177.67
759	23.43.29.100
760	188.42.162.193
760	88.85.82.180
760	194.187.98.176
761	104.25.204.29
761	104.25.205.29
762	212.82.100.151
762	124.108.115.101
762	98.136.103.24
762	74.6.136.151
762	106.10.248.151
763	47.95.170.110
764	172.217.17.67
765	212.101.122.34
766	104.20.0.156
766	104.20.68.156
767	182.253.240.27
768	182.253.240.28
769	151.101.128.194
769	151.101.192.194
769	151.101.64.194
769	151.101.0.194
770	151.101.38.89
771	202.80.220.78
772	202.80.220.88
773	202.80.220.58
774	202.80.220.78
775	202.147.199.228
780	216.228.121.209
781	204.155.149.42
781	204.155.149.43
781	204.155.146.95
781	204.155.149.41
783	95.163.95.149
783	95.163.95.169
783	95.163.94.199
783	95.163.94.239
783	95.163.95.9
783	95.163.95.29
783	95.163.95.59
783	95.163.95.109
783	95.163.95.129
784	113.217.247.100
788	155.199.192.111
788	155.199.32.138
788	155.199.64.173
788	155.199.80.173
793	216.211.130.168
794	213.180.141.140
796	216.35.221.76
797	210.189.86.12
801	194.50.69.124
801	91.211.75.124
804	151.101.1.69
804	151.101.65.69
804	151.101.129.69
804	151.101.193.69
805	13.64.188.167
806	52.174.24.83
807	42.236.9.70
808	208.88.227.170
809	72.233.72.153
810	78.140.185.31
811	198.11.188.13
811	198.11.188.78
812	31.222.66.32
812	31.222.66.33
813	84.47.177.238
814	83.69.196.149
815	95.163.94.128
816	83.69.196.150
817	178.159.255.34
818	175.126.117.211
819	1.255.89.11
820	113.217.247.73
821	117.78.42.66
822	172.217.17.67
823	172.217.17.73
824	205.201.132.96
825	210.51.19.63
826	5.134.210.134
827	104.27.215.28
827	104.27.214.28
828	122.147.53.67
829	209.225.49.79
829	216.33.197.79
830	178.248.233.32
831	172.217.17.68
832	172.64.137.6
832	172.64.136.6
833	192.223.136.36
834	192.223.170.166
835	192.223.189.182
836	221.143.22.47
837	176.53.93.6
838	172.217.17.67
839	34.240.50.238
839	52.17.216.239
839	54.154.100.48
840	59.151.5.6
841	104.27.155.203
841	104.27.154.203
842	66.135.201.153
842	66.211.181.20
842	66.211.185.77
842	66.135.211.132
842	66.211.181.235
843	94.247.132.236
843	94.247.132.237
843	94.247.132.238
844	144.160.155.43
844	144.160.36.42
845	98.124.199.35
846	104.27.158.148
846	104.27.159.148
847	172.217.17.67
848	185.94.84.100
849	151.101.37.194
850	23.0.45.84
851	52.42.223.201
851	35.164.25.103
852	104.25.65.8
852	104.25.64.8
853	92.122.206.83
853	92.122.206.69
854	23.54.138.233
855	192.16.16.5
856	192.16.16.6
857	198.7.29.5
858	198.7.29.6
859	23.62.99.58
859	23.62.99.66
860	54.88.196.117
860	52.206.66.47
861	213.180.128.240
862	213.180.128.242
863	213.180.137.160
864	213.180.147.200
865	162.212.41.11
866	195.82.146.214
867	104.24.29.35
867	104.24.28.35
868	5.11.81.144
868	5.11.87.101
869	104.16.253.5
869	104.16.251.5
869	104.16.252.5
869	104.16.249.5
869	104.16.250.5
870	172.217.17.67
871	205.153.36.175
872	209.144.103.30
873	209.144.103.30
874	210.189.86.9
875	61.211.236.1
876	133.167.21.1
877	185.37.100.123
878	172.64.101.2
878	172.64.100.2
879	216.18.168.66
880	104.24.255.11
880	104.24.254.11
881	104.18.215.186
881	104.18.218.186
881	104.18.217.186
881	104.18.216.186
881	104.18.214.186
882	72.166.186.169
883	74.113.188.100
884	66.211.181.20
884	66.211.185.77
884	66.135.211.132
884	66.211.181.235
884	66.135.201.153
885	118.102.1.119
886	185.53.36.101
887	148.251.77.209
888	211.231.108.151
889	208.43.60.11
889	67.228.27.109
889	75.126.182.36
889	67.228.27.112
889	67.228.27.111
889	75.126.182.37
889	50.22.67.98
889	67.228.27.113
889	75.126.123.82
889	75.126.182.35
889	67.228.27.100
889	67.228.27.110
890	23.212.234.129
891	94.124.200.86
892	104.20.68.21
892	104.20.67.21
893	104.17.252.23
893	104.17.1.24
893	104.17.255.23
893	104.17.254.23
893	104.17.253.23
894	192.0.72.3
895	46.166.188.38
895	46.166.188.35
895	46.166.188.36
895	46.166.188.37
896	194.50.69.18
897	91.211.75.18
898	5.187.1.122
899	172.217.17.67
900	151.101.2.114
900	151.101.66.114
900	151.101.130.114
900	151.101.194.114
901	198.134.112.243
901	198.134.112.242
901	198.134.112.241
901	198.134.112.244
902	92.62.130.180
903	104.25.232.115
903	104.25.231.115
904	2.19.61.89
905	104.20.35.236
905	104.20.34.236
906	104.17.108.49
906	104.17.110.49
906	104.17.111.49
906	104.17.107.49
906	104.17.109.49
907	192.107.237.22
908	104.27.150.190
908	104.27.151.190
909	104.103.185.202
910	195.154.120.129
911	34.206.170.76
911	52.3.40.255
912	185.94.140.30
913	95.100.97.6
913	95.100.97.9
914	212.96.161.229
914	185.189.92.41
915	104.17.227.106
915	104.17.230.106
915	104.17.231.106
915	104.17.228.106
915	104.17.229.106
916	172.64.139.6
916	172.64.138.6
917	104.23.131.67
917	104.23.132.67
918	66.135.211.132
918	66.211.181.20
918	66.211.185.77
918	66.135.201.153
918	66.211.181.235
919	198.41.214.162
919	198.41.215.162
920	162.208.32.99
921	172.64.194.2
921	172.64.195.2
922	208.51.38.241
923	72.247.179.123
923	72.247.179.145
924	151.101.0.84
924	151.101.64.84
924	151.101.128.84
924	151.101.192.84
930	185.72.229.13
930	80.68.253.13
932	185.44.0.16
932	185.44.0.26
932	185.44.0.36
933	195.211.221.116
934	140.205.34.12
934	140.205.32.13
934	140.205.172.20
934	140.205.172.21
934	140.205.230.3
935	104.25.186.6
935	104.25.187.6
936	103.6.182.20
937	115.112.203.158
938	185.89.12.132
939	104.25.96.28
939	104.25.97.28
940	2.19.58.126
941	104.25.116.113
941	104.25.115.113
942	172.217.17.67
943	5.39.224.140
944	104.82.101.211
945	104.25.15.31
945	104.25.14.31
946	104.20.31.186
946	104.20.30.186
947	223.165.27.146
948	104.81.108.67
949	104.31.19.30
949	104.31.18.30
950	159.203.157.16
951	104.25.80.106
951	104.25.79.106
952	104.86.110.146
952	104.86.110.136
953	204.155.151.79
953	204.155.151.80
954	195.128.8.101
955	193.110.128.109
956	104.20.42.98
956	104.20.41.98
957	104.20.223.36
957	104.20.222.36
958	173.0.157.59
959	195.78.85.110
960	2.20.36.80
961	212.31.252.70
962	81.19.72.0
962	81.19.72.1
962	81.19.72.2
962	81.19.72.5
962	81.19.72.3
962	81.19.72.4
963	52.204.232.145
963	52.70.114.30
963	52.200.12.129
963	52.20.198.134
963	52.22.135.100
963	52.200.202.27
963	52.70.238.183
964	216.146.46.11
964	216.146.46.10
965	192.30.253.113
965	192.30.253.112
966	172.217.17.68
967	162.125.248.1
968	54.243.75.57
968	107.21.237.154
968	184.72.217.110
968	107.21.219.180
969	104.20.42.23
969	104.20.41.23
970	172.217.17.67
971	93.93.53.190
972	143.204.101.65
972	143.204.101.90
972	143.204.101.8
972	143.204.101.13
973	192.0.66.2
974	104.82.122.154
975	52.84.150.31
975	52.84.150.27
975	52.84.150.26
975	52.84.150.11
976	192.229.189.15
976	192.229.162.112
976	192.229.182.112
977	34.235.56.176
977	52.7.178.92
978	5.255.255.55
978	77.88.55.66
978	5.255.255.5
978	77.88.55.55
979	143.204.101.20
979	143.204.101.55
979	143.204.101.49
979	143.204.101.118
980	79.125.105.113
980	46.51.179.90
980	176.34.155.23
981	52.72.26.162
982	143.204.101.32
982	143.204.101.8
982	143.204.101.122
982	143.204.101.9
983	85.111.27.87
984	216.18.168.116
985	87.250.255.11
986	151.101.1.164
986	151.101.65.164
986	151.101.193.164
986	151.101.129.164
987	52.17.127.232
987	34.252.174.246
988	172.217.17.67
989	104.103.157.249
990	172.217.17.67
991	13.228.90.128
992	40.115.23.107
993	23.201.103.27
993	23.201.103.32
994	80.68.247.10
995	80.68.253.26
996	185.166.140.55
996	185.166.140.56
996	185.166.140.57
997	1.201.140.237
997	1.201.136.217
998	143.204.101.20
998	143.204.101.13
998	143.204.101.90
998	143.204.101.49
999	50.19.82.148
1000	185.44.0.100
1001	93.191.15.17
1002	104.103.245.153
1003	216.87.148.114
1004	137.188.80.90
1004	162.115.208.90
1004	162.115.16.90
1005	198.134.112.244
1005	198.134.112.241
1005	198.134.112.242
1005	198.134.112.243
1006	143.204.101.90
1006	143.204.101.10
1006	143.204.101.88
1006	143.204.101.123
1007	198.134.112.244
1007	198.134.112.243
1007	198.134.112.241
1007	198.134.112.242
1008	91.197.44.119
1009	91.197.44.118
1010	91.197.44.117
1011	91.197.44.12
1012	91.197.45.4
1013	104.20.83.194
1013	104.20.82.194
1014	216.18.168.52
1015	104.20.26.96
1015	104.20.27.96
1016	209.68.24.127
1016	64.130.3.227
1017	184.154.69.154
1018	143.204.101.25
1018	143.204.101.9
1018	143.204.101.50
1018	143.204.101.65
1019	93.93.68.145
1020	193.34.169.16
1021	143.204.101.121
1021	143.204.101.107
1021	143.204.101.64
1021	143.204.101.119
1022	23.212.234.145
1023	54.84.118.104
1023	54.89.68.232
1024	204.62.115.78
1025	107.178.245.188
1026	52.25.109.230
1027	23.64.224.246
1028	106.11.35.30
1028	106.11.35.29
1029	140.205.71.248
1029	42.156.241.248
1030	140.205.2.187
1030	198.11.138.248
1031	81.171.123.200
1032	52.2.61.110
1033	202.6.246.33
1034	104.82.127.147
1035	52.45.55.52
1035	52.72.138.32
1035	52.45.70.146
1036	104.16.146.241
1036	104.16.147.241
1037	193.28.225.200
1038	192.147.130.204
1038	193.104.215.58
1039	216.115.208.241
1040	143.204.101.49
1040	143.204.101.39
1040	143.204.101.29
1040	143.204.101.12
1041	104.103.122.31
1042	13.250.72.180
1042	52.76.136.196
1045	192.33.31.161
1047	178.252.170.252
1047	185.167.72.20
1048	178.248.233.26
1050	200.12.18.22
1052	153.254.147.65
1053	208.94.152.100
1053	208.94.153.100
1054	77.234.45.78
1054	77.234.41.52
1054	77.234.42.85
1054	77.234.43.52
1056	90.216.129.62
1057	143.204.93.160
1058	52.6.169.224
1058	52.73.32.25
1058	34.199.29.248
1058	52.206.161.135
1058	54.175.117.186
1058	54.174.45.144
1059	104.82.109.157
1060	143.204.95.200
1061	52.220.249.13
1061	54.251.160.113
1062	104.82.129.222
1063	104.16.83.211
1063	104.16.82.211
1063	104.16.85.211
1063	104.16.84.211
1063	104.16.81.211
1064	199.182.50.57
1065	199.182.50.58
1066	151.101.129.69
1066	151.101.1.69
1066	151.101.65.69
1066	151.101.193.69
1067	198.134.112.242
1067	198.134.112.244
1067	198.134.112.241
1067	198.134.112.243
1068	172.217.17.67
1069	185.165.123.77
1070	54.163.247.71
1071	178.33.63.127
1072	104.103.200.178
1073	52.73.212.201
1073	54.236.228.139
1074	52.22.5.243
1074	34.192.57.190
1075	104.20.137.61
1075	104.20.136.61
1076	208.75.122.14
1077	119.254.76.148
1078	18.234.20.180
1078	18.234.20.188
1078	18.234.20.183
1079	195.8.215.136
1080	203.130.48.145
1080	203.130.48.144
1081	185.167.72.25
1082	178.252.170.252
1083	31.184.129.25
1084	85.185.91.135
1085	54.194.188.213
1085	52.48.206.211
1085	52.31.135.201
1085	34.255.78.62
1086	54.164.99.138
1086	54.164.30.188
1087	23.212.234.230
1088	151.101.65.184
1088	151.101.129.184
1088	151.101.193.184
1088	151.101.1.184
1089	172.64.201.3
1089	172.64.200.3
1090	195.93.246.187
1091	195.93.246.212
1092	104.25.117.119
1092	104.25.118.119
1093	104.103.122.109
1094	104.31.75.39
1094	104.31.74.39
1095	151.101.129.84
1095	151.101.65.84
1095	151.101.1.84
1095	151.101.193.84
1096	47.89.133.85
1097	104.20.60.241
1097	104.20.59.241
1098	155.64.49.54
1098	155.64.16.51
1099	95.213.4.234
1100	34.252.28.153
1100	52.31.87.113
1100	54.246.171.232
1101	183.56.150.155
1101	113.107.238.14
1101	119.147.33.33
1101	113.105.73.141
1101	183.56.150.142
1101	113.107.238.27
1101	113.107.238.12
1101	113.107.238.15
1101	119.147.253.25
1101	113.107.238.11
1101	113.105.73.148
1101	119.147.33.36
1101	183.56.150.144
1101	113.105.73.142
1101	183.56.150.146
1101	119.147.253.23
1102	92.122.17.185
1103	185.6.169.69
1104	104.27.241.252
1104	104.27.240.252
1105	104.103.189.23
1106	185.7.96.91
1106	95.211.208.200
1106	185.7.96.90
1106	95.211.208.208
1107	2.19.56.60
1108	104.17.81.135
1108	104.17.79.135
1108	104.17.78.135
1108	104.17.80.135
1108	104.17.77.135
1109	104.81.101.129
1110	185.42.236.11
1111	35.201.234.200
1112	5.63.150.180
1113	143.204.101.93
1113	143.204.101.25
1113	143.204.101.91
1113	143.204.101.100
1114	45.60.149.132
1114	45.60.169.132
1115	172.217.17.67
1116	202.6.246.32
1117	52.30.238.17
1117	52.19.40.147
1117	52.17.27.129
1117	52.214.179.84
1117	52.17.227.174
1117	52.19.113.209
1117	52.17.14.18
1117	54.171.187.60
1118	184.72.124.184
1119	200.12.17.253
1120	200.12.23.250
1121	200.12.18.250
1122	200.12.22.250
1123	54.174.214.170
1123	34.225.40.45
1124	54.215.201.153
1124	54.219.161.51
1124	54.193.75.88
1124	54.193.54.141
1124	54.67.36.238
1124	52.8.60.202
1124	54.67.36.100
1124	54.215.226.128
1125	151.101.65.67
1125	151.101.193.67
1125	151.101.129.67
1125	151.101.1.67
1126	143.204.93.223
1127	151.101.1.177
1127	151.101.193.177
1127	151.101.65.177
1127	151.101.129.177
1128	13.114.118.178
1128	52.199.111.149
1129	104.127.209.4
1130	54.86.74.191
1130	34.206.16.240
1131	185.235.236.196
1132	54.148.168.222
1132	52.11.155.253
1133	143.204.101.20
1133	143.204.101.63
1133	143.204.101.87
1133	143.204.101.42
1134	151.101.1.28
1134	151.101.129.28
1134	151.101.193.28
1134	151.101.65.28
1135	69.147.88.7
1135	69.147.92.11
1136	103.6.0.121
1136	103.6.0.120
1137	172.217.17.67
1138	23.33.90.138
1139	143.204.101.100
1139	143.204.101.42
1139	143.204.101.35
1139	143.204.101.50
1140	13.115.18.61
1140	13.230.115.161
1141	52.33.182.156
1141	54.213.36.26
1142	54.254.176.158
1142	52.74.158.163
1143	207.229.73.118
1143	207.229.73.117
1144	111.65.248.132
1145	52.76.227.95
1145	52.76.255.100
1146	104.16.43.64
1146	104.16.44.64
1147	188.72.213.123
1147	188.72.213.122
1147	188.72.213.121
1148	210.144.64.76
1149	210.144.64.77
1150	208.94.152.190
1151	208.94.153.190
1152	75.125.29.226
1153	77.234.47.13
1154	91.213.143.1
1155	91.213.143.11
1156	34.255.51.249
1156	52.213.29.106
1157	109.169.55.249
1158	52.54.227.239
1159	52.7.205.218
1159	54.89.30.61
1160	87.248.116.13
1160	87.248.116.14
1161	23.251.125.131
1161	23.251.124.131
1161	23.251.126.133
1167	118.191.216.57
1167	118.191.216.42
1170	119.235.235.13
1171	117.18.232.133
1172	202.108.33.60
1172	202.108.33.107
1173	45.249.212.124
1175	174.143.228.153
1182	200.201.165.253
1182	200.201.172.223
1182	200.201.166.253
1182	200.201.171.223
1186	202.108.8.82
1188	42.81.62.213
1190	200.147.67.142
1191	122.70.142.183
1191	43.243.234.234
1191	111.206.239.19
1192	140.98.193.152
1193	122.147.226.250
1194	147.67.119.170
1194	147.67.136.60
1194	147.67.136.135
1194	147.67.136.170
1194	147.67.119.60
1194	147.67.119.135
1197	103.93.210.60
1197	103.93.211.60
1199	219.153.58.101
1200	111.11.31.225
1203	203.104.137.1
1204	203.104.137.9
1205	35.163.23.137
1205	54.71.250.83
1206	23.111.87.204
1206	23.111.87.84
1206	188.42.138.164
1206	188.42.131.12
1206	188.42.138.156
1206	188.42.137.132
1206	188.42.131.20
1206	188.42.140.108
1206	188.42.141.36
1206	23.111.229.124
1206	188.42.140.100
1206	23.111.87.220
1206	188.42.137.140
1207	23.56.223.12
1208	192.16.16.5
1209	192.16.16.6
1210	198.7.29.5
1211	198.7.29.6
1212	108.60.221.55
1212	108.60.221.54
1212	108.60.221.56
1212	108.60.221.53
1213	24.105.29.30
1214	192.170.156.116
1215	151.101.193.5
1215	151.101.1.5
1215	151.101.129.5
1215	151.101.65.5
1216	54.169.61.9
1216	52.76.24.232
1217	54.210.89.130
1217	34.205.49.39
1217	34.196.141.117
1217	107.23.174.153
1217	54.88.21.90
1218	114.134.80.162
1219	143.204.101.15
1219	143.204.101.74
1219	143.204.101.127
1219	143.204.101.96
1220	18.234.32.155
1220	18.234.32.156
1220	18.234.32.157
1221	146.255.192.77
1221	146.255.192.75
1222	151.101.194.217
1222	151.101.2.217
1222	151.101.130.217
1222	151.101.66.217
1223	202.130.245.42
1224	202.106.184.166
1225	61.172.201.254
1226	123.125.29.99
1227	121.14.1.22
1228	45.249.212.230
1229	116.66.184.201
1229	206.16.17.219
1230	122.96.104.66
1231	185.176.76.229
1232	172.217.17.67
1233	104.153.64.122
1234	115.159.231.173
1235	72.3.172.249
1236	72.3.172.250
1237	34.198.18.191
1238	34.192.165.114
1239	52.36.105.169
1240	34.217.162.58
1241	205.203.139.53
1242	54.94.215.89
1242	54.94.162.238
1242	54.94.183.198
1242	18.231.12.180
1243	202.239.30.129
1244	170.167.117.81
1245	107.154.102.99
1246	36.51.254.228
1246	36.51.254.229
1247	111.13.101.208
1247	123.125.114.144
1247	180.149.132.47
1247	220.181.57.217
1248	151.101.66.110
1248	151.101.130.110
1248	151.101.2.110
1248	151.101.194.110
1249	101.227.188.172
1249	101.227.188.174
1249	101.227.188.176
1249	101.227.188.178
1249	101.227.188.170
1250	54.88.155.189
1250	54.84.219.225
1250	54.191.45.214
1250	54.191.118.141
1251	143.204.101.125
1251	143.204.101.123
1251	143.204.101.71
1251	143.204.101.23
1252	143.204.101.80
1252	143.204.101.56
1252	143.204.101.69
1252	143.204.101.82
1253	34.203.199.183
1254	104.27.100.99
1254	104.27.101.99
1255	38.27.97.23
1256	172.217.17.67
1257	176.56.156.136
1257	176.56.156.137
1258	85.111.56.8
1259	202.129.216.26
1260	143.204.101.75
1260	143.204.101.118
1260	143.204.101.84
1260	143.204.101.12
1261	52.74.223.93
1262	68.169.89.142
1263	96.45.82.26
1263	96.45.83.113
1263	96.45.83.233
1263	96.45.82.193
1264	172.217.17.67
1265	188.254.86.254
1266	54.173.174.87
1267	200.201.172.21
1268	200.201.171.21
1269	200.201.161.23
1270	200.201.161.22
1271	216.33.197.90
1271	209.225.49.90
1272	106.75.32.98
1273	180.97.180.206
1274	58.216.22.26
1275	60.222.200.121
1276	220.194.200.67
1277	60.222.200.121
1278	60.222.200.121
1279	42.62.30.180
1280	124.243.192.30
1281	172.217.17.67
1282	203.93.27.6
1283	203.93.27.7
1284	219.141.244.3
1285	182.92.20.91
1286	118.191.216.57
1286	118.191.216.42
1287	118.191.216.61
1287	123.126.51.12
1288	180.149.156.12
1289	202.99.16.4
1290	42.81.124.83
1291	60.28.251.1
1292	59.173.14.26
1293	188.254.86.254
1294	104.20.9.75
1294	104.20.10.75
1295	200.147.38.8
1296	200.147.255.105
1297	200.221.11.98
1298	223.223.182.226
1299	182.48.113.104
1300	182.48.117.205
1301	117.25.139.69
1302	140.98.193.128
1303	63.84.220.182
1304	208.99.166.238
1305	58.218.204.252
1306	113.31.88.229
1306	113.31.88.230
1307	220.228.205.189
1308	61.219.52.126
1309	147.67.250.2
1310	147.67.12.2
1311	147.67.250.3
1312	147.67.12.3
1313	208.109.192.71
1313	104.238.65.190
1314	121.29.18.27
1315	172.217.17.68
1316	67.43.7.192
1317	118.184.184.70
1318	103.93.210.253
1319	103.93.211.253
1320	188.166.180.242
1321	128.199.167.249
1322	58.83.160.155
1322	58.83.160.156
1323	176.53.59.98
1323	176.53.59.96
1323	176.53.59.97
1324	182.92.20.106
1325	118.89.206.145
1326	202.108.119.193
1326	202.108.119.194
1327	151.101.36.144
1328	162.159.229.132
1328	162.159.228.132
1329	113.204.98.131
1330	219.153.58.174
1331	222.177.27.240
1332	122.70.135.62
1333	60.28.222.5
1334	42.62.27.63
1335	218.30.118.208
1335	106.120.167.69
1336	45.61.5.241
1336	45.61.5.242
1336	45.61.5.243
1336	45.61.5.244
1337	180.101.38.35
1338	180.76.76.118
1339	119.75.222.16
1340	61.135.165.228
1341	220.181.38.72
1342	111.206.37.209
1343	119.75.222.15
1344	61.135.165.227
1345	124.250.72.168
1346	101.37.178.168
1347	40.114.244.193
1348	157.185.149.167
1349	180.153.106.86
1349	180.153.106.87
\.


--
-- TOC entry 2906 (class 0 OID 24633)
-- Dependencies: 198
-- Data for Name: ip_address; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ip_address (ip) FROM stdin;
31.13.72.36
77.88.55.66
5.255.255.60
77.88.55.60
5.255.255.55
111.13.28.118
120.52.148.118
221.179.177.36
220.181.90.52
123.125.116.28
123.125.115.110
220.181.57.216
98.137.246.8
98.138.219.231
72.30.35.9
98.138.219.232
72.30.35.10
98.137.246.7
199.181.132.250
31.216.148.10
89.44.169.135
172.217.17.78
108.174.10.10
91.198.174.192
172.217.17.73
172.217.17.67
213.180.193.1
93.158.134.1
111.13.28.10
111.206.226.10
120.52.149.254
106.39.177.32
111.202.126.2
220.181.20.2
103.239.204.103
103.239.204.104
125.254.154.167
125.254.154.168
87.240.129.71
87.240.129.133
87.240.180.136
87.240.182.224
151.101.193.140
151.101.65.140
151.101.1.140
151.101.129.140
140.205.94.189
140.205.220.96
176.32.103.205
205.251.242.103
176.32.98.166
69.171.255.12
69.171.239.12
202.108.22.220
61.135.165.235
220.181.37.10
220.181.38.10
180.76.76.92
188.254.86.254
111.161.64.48
111.161.64.40
68.180.131.16
68.142.255.16
203.84.221.53
98.138.11.157
119.160.253.83
104.244.42.65
104.244.42.129
88.208.18.30
88.208.29.24
140.205.94.193
140.205.130.99
36.110.213.49
216.18.168.16
104.17.98.21
104.17.99.21
216.18.168.1
104.27.216.28
104.27.217.28
103.194.153.149
103.194.152.149
109.71.161.200
185.88.181.9
185.88.181.10
185.88.181.11
185.88.181.2
185.88.181.3
185.88.181.4
185.88.181.5
185.88.181.6
185.88.181.7
185.88.181.8
123.57.253.206
151.101.64.81
151.101.0.81
151.101.128.81
151.101.192.81
108.174.10.19
104.154.127.47
104.199.64.136
104.199.240.211
118.178.113.110
103.23.108.107
123.58.180.8
123.58.180.7
8.39.54.155
172.64.175.2
172.64.174.2
106.11.47.20
184.173.147.38
169.44.84.178
184.173.147.39
169.44.82.102
192.155.212.203
192.155.212.202
5.57.16.220
151.101.12.193
107.22.178.157
159.53.42.11
159.53.113.168
159.53.85.137
159.53.84.126
159.53.116.62
159.53.44.60
159.53.224.21
203.104.153.16
77.247.179.176
107.178.250.249
192.234.2.11
192.234.2.12
74.123.203.97
74.123.200.193
208.85.64.193
52.95.120.39
52.95.116.113
54.239.33.91
210.89.160.88
125.209.222.141
210.89.164.90
125.209.222.142
192.204.15.223
42.156.140.12
140.205.174.2
103.64.14.21
103.64.14.17
103.64.14.20
103.64.14.18
151.101.194.167
151.101.2.167
151.101.130.167
151.101.66.167
63.245.208.195
23.212.232.182
172.64.199.3
172.64.198.3
104.16.59.5
104.16.58.5
104.108.55.123
104.20.26.43
104.20.27.43
122.14.229.8
104.20.9.153
104.20.10.153
133.237.61.176
35.241.35.213
194.54.14.159
31.216.148.11
31.216.148.13
103.244.183.5
122.56.56.216
178.18.22.152
103.68.220.61
62.22.171.50
172.217.17.68
149.154.167.99
203.195.147.223
115.159.159.215
216.239.116.100
88.212.236.84
88.212.236.76
89.107.171.183
35.233.114.27
159.45.2.143
159.45.170.143
159.45.66.143
170.146.93.56
146.197.184.71
216.33.197.84
209.225.49.84
188.72.213.220
188.72.213.221
188.72.213.175
188.42.162.184
188.42.162.170
188.72.213.176
23.0.43.238
185.47.12.153
185.104.133.10
185.47.12.150
185.104.133.9
185.104.133.8
185.47.12.155
185.47.12.151
185.104.133.11
46.28.208.141
69.64.59.58
46.28.208.142
24.105.29.30
104.20.18.183
104.20.19.183
151.101.1.111
151.101.65.111
151.101.129.111
151.101.193.111
47.90.2.56
104.20.38.253
104.20.37.253
15.72.228.83
15.73.104.147
15.73.192.108
15.72.164.74
151.101.65.52
151.101.1.52
151.101.129.52
151.101.193.52
35.201.95.83
94.23.144.230
159.45.75.60
159.45.5.52
209.112.113.33
104.27.20.101
104.27.21.101
151.101.130.133
151.101.194.133
151.101.66.133
151.101.2.133
104.18.31.233
104.18.30.233
198.134.112.244
198.134.112.241
198.134.112.243
198.134.112.242
64.30.228.118
137.254.120.50
210.163.219.24
185.195.230.7
23.0.213.133
104.16.119.221
104.16.117.221
104.16.116.221
104.16.120.221
104.16.118.221
170.146.146.170
170.146.170.146
104.25.120.112
104.25.119.112
103.6.117.2
103.6.117.3
104.20.9.120
104.20.10.120
172.64.193.4
172.64.192.4
182.92.104.151
72.246.101.19
104.19.194.29
104.19.195.29
104.20.2.139
104.20.1.139
209.172.193.49
61.244.33.163
104.24.13.115
104.24.14.115
178.236.137.57
178.236.137.118
178.236.137.154
178.236.137.156
178.236.137.157
66.29.212.110
161.69.17.94
161.69.25.181
95.216.86.133
82.165.229.87
141.101.120.54
141.101.120.55
124.243.228.136
95.213.4.234
23.236.60.174
140.205.164.45
107.154.102.19
107.154.103.19
156.53.53.53
156.53.53.54
23.21.220.245
151.101.2.219
151.101.130.219
151.101.194.219
151.101.66.219
104.103.202.62
192.33.31.183
222.223.239.125
104.25.101.106
104.25.102.106
77.75.77.39
60.12.149.194
104.111.245.34
124.127.180.200
172.64.140.7
172.64.141.7
72.246.146.30
151.101.129.197
151.101.193.197
151.101.1.197
151.101.65.197
54.251.103.25
54.251.99.37
52.94.226.87
52.94.237.126
54.239.26.220
104.238.65.160
208.109.192.70
151.101.36.116
213.239.228.132
213.239.228.130
172.64.135.5
172.64.134.5
104.27.120.50
104.27.121.50
2.22.111.12
106.48.12.36
106.48.12.102
106.48.14.68
106.48.14.64
106.48.12.68
119.188.140.75
122.228.86.69
209.102.213.14
192.64.119.83
104.16.33.27
104.16.32.27
103.10.4.216
124.250.78.6
125.6.146.13
211.45.27.231
203.76.216.1
104.16.111.12
104.16.108.12
104.16.109.12
104.16.107.12
104.16.110.12
173.0.146.147
173.0.146.10
173.0.146.148
103.49.221.130
203.190.242.254
104.25.6.27
104.25.7.27
104.17.60.91
104.17.59.91
104.17.58.91
104.17.57.91
104.17.61.91
140.205.77.240
115.238.23.240
123.103.56.42
217.74.65.23
208.85.40.20
208.85.40.50
185.134.201.6
185.134.202.6
185.134.202.5
185.134.201.245
185.134.201.5
140.207.228.45
72.163.4.185
208.82.237.226
110.75.129.5
110.75.139.5
182.22.59.229
183.79.135.206
72.21.206.80
207.171.166.22
72.21.210.29
54.222.60.218
210.129.120.45
210.129.120.56
210.129.120.49
212.77.98.9
104.25.66.16
104.25.67.16
64.30.228.126
198.176.43.184
87.245.198.78
69.172.201.47
212.95.74.42
198.41.209.131
198.41.209.133
198.41.208.132
198.41.208.133
198.41.209.132
129.42.38.10
66.211.181.20
66.135.211.132
66.211.185.77
66.135.201.153
66.211.181.235
188.254.86.252
207.242.93.24
62.22.15.85
113.5.80.47
111.202.83.249
14.18.201.112
45.124.126.179
60.220.194.228
169.48.161.43
106.11.248.153
104.24.9.73
104.24.8.73
217.74.65.131
178.33.44.27
64.58.116.132
200.44.45.12
69.164.39.141
79.175.141.111
79.175.141.112
79.175.141.110
94.130.238.226
173.192.129.99
173.192.129.101
173.192.129.102
173.192.129.100
173.192.129.103
104.20.114.3
104.20.115.3
194.50.69.193
91.211.75.196
185.64.253.1
107.150.101.156
104.16.15.221
104.16.16.221
104.16.18.221
104.16.17.221
104.16.14.221
213.209.17.209
123.58.9.80
50.31.185.52
64.74.232.52
104.16.79.22
104.16.77.22
104.16.78.22
104.16.80.22
104.16.81.22
103.5.51.124
103.5.51.123
199.116.165.40
199.116.165.20
104.20.0.94
104.20.1.94
35.241.54.163
128.65.210.8
211.151.213.244
96.45.83.233
96.45.82.193
96.45.83.113
96.45.82.26
81.19.72.37
81.19.72.36
81.19.72.34
81.19.72.35
81.19.72.38
81.19.72.39
37.233.84.12
130.193.66.229
92.242.43.211
107.154.247.36
107.154.248.36
104.20.129.46
104.20.128.46
208.93.170.15
151.101.2.49
151.101.130.49
151.101.66.49
151.101.194.49
185.26.230.129
176.53.43.5
176.53.43.3
176.53.43.4
176.53.43.9
176.53.43.7
176.53.43.11
176.53.43.10
176.53.43.8
176.53.43.2
176.53.43.6
103.77.118.135
103.77.118.136
151.101.193.181
151.101.65.181
151.101.1.181
151.101.129.181
185.179.62.2
210.13.114.42
140.206.211.7
210.13.114.44
114.80.10.7
101.226.248.130
101.226.248.131
140.207.228.14
140.207.228.15
65.39.251.71
65.39.251.72
65.39.251.69
65.39.251.70
72.163.5.201
64.102.255.44
173.37.146.41
34.202.46.121
34.197.148.4
34.204.250.133
34.224.9.38
34.205.126.7
34.195.82.122
34.203.51.197
34.203.126.169
104.24.4.33
104.24.5.33
145.243.240.20
145.243.248.20
208.82.237.71
208.82.237.72
208.82.238.71
208.82.238.72
180.240.134.85
104.20.49.205
104.20.50.205
154.8.131.172
154.8.131.165
154.8.131.171
151.101.193.224
151.101.65.224
151.101.129.224
151.101.1.224
52.94.225.248
52.94.228.167
52.94.237.74
218.211.33.75
185.88.181.53
185.88.181.54
185.88.181.55
185.88.181.56
185.88.181.57
185.88.181.58
185.88.181.59
185.88.181.60
64.4.250.33
64.4.250.32
104.25.72.110
104.25.71.110
42.121.252.58
104.244.42.197
104.244.42.133
104.244.42.5
104.244.42.69
217.20.155.13
5.61.23.11
217.20.147.1
109.236.92.143
109.236.92.166
217.23.13.45
217.23.13.91
109.236.84.145
109.236.84.136
151.101.202.110
192.0.78.9
192.0.78.17
151.101.0.84
151.101.64.84
151.101.128.84
151.101.192.84
121.42.17.239
121.42.17.238
198.11.132.250
104.17.201.68
104.17.200.68
104.17.197.68
104.17.199.68
104.17.198.68
110.75.240.29
45.113.40.61
110.76.21.66
110.76.21.88
45.113.40.93
110.75.232.61
151.101.1.69
151.101.65.69
151.101.129.69
151.101.193.69
118.151.254.133
118.151.254.149
124.83.255.37
124.83.255.101
205.251.192.27
205.251.195.199
156.154.64.10
156.154.65.10
156.154.68.10
13.91.95.74
104.20.171.49
104.20.170.49
5.226.176.16
210.129.120.60
210.129.120.62
95.85.28.135
95.85.39.215
104.20.19.239
104.20.18.239
23.66.16.128
17.172.224.47
17.142.160.59
17.178.96.59
207.241.224.2
123.125.114.5
180.149.132.3
220.181.163.1
61.135.162.10
204.135.13.50
204.135.13.155
204.135.13.175
204.135.8.175
204.135.8.155
204.135.8.50
124.225.65.154
171.67.215.200
203.133.167.81
203.133.167.16
211.231.99.17
211.231.99.80
217.69.139.201
94.100.180.200
94.100.180.201
217.69.139.200
56.0.134.100
190.205.112.69
190.205.112.68
34.235.254.128
52.3.14.103
54.165.90.249
208.70.31.236
208.70.31.251
180.76.1.26
140.205.35.14
31.13.72.8
104.16.168.50
104.16.167.50
104.16.165.50
104.16.164.50
104.16.166.50
199.81.212.13
204.135.12.100
199.81.217.100
185.147.178.13
185.147.178.14
185.147.178.12
185.147.178.11
123.53.182.233
123.53.182.232
218.77.130.10
221.11.172.10
124.225.214.10
113.59.107.10
104.23.105.173
104.23.104.173
94.228.214.149
171.159.228.150
171.161.148.150
46.28.53.115
47.95.164.112
216.21.13.12
216.21.13.13
171.64.7.115
171.64.7.61
204.63.227.77
148.251.23.152
203.190.242.211
103.49.221.211
119.254.147.230
119.254.147.247
103.5.149.90
103.5.149.91
17.253.200.1
17.253.207.1
204.19.119.1
204.26.57.1
208.78.70.129
204.13.250.129
17.171.63.30
17.171.63.40
104.18.72.52
104.18.73.52
104.18.75.52
104.18.76.52
104.18.74.52
47.74.234.244
66.6.33.31
66.6.32.31
66.6.33.159
52.94.225.242
54.239.18.172
54.239.19.238
185.230.60.164
185.230.61.164
119.145.147.177
64.68.121.205
104.20.71.110
104.20.72.110
118.89.204.109
118.89.204.100
118.89.204.190
104.16.123.127
104.16.122.127
104.16.124.127
104.16.121.127
104.16.120.127
185.37.100.122
104.82.246.170
104.16.117.25
104.16.118.25
35.190.29.187
66.135.216.190
66.135.209.52
66.211.181.123
66.211.185.25
66.211.160.86
66.211.162.12
104.17.141.178
104.17.138.178
104.17.137.178
104.17.139.178
104.17.140.178
198.185.159.176
198.185.159.177
198.49.23.176
198.49.23.177
202.248.110.184
13.251.82.126
13.251.168.238
192.161.154.1
104.17.127.66
104.17.128.66
104.17.129.66
104.17.131.66
104.17.130.66
96.43.148.26
96.43.149.26
103.6.0.2
103.6.0.3
103.6.0.15
113.61.106.5
113.61.107.5
69.187.23.20
69.191.252.148
94.182.163.52
94.182.163.51
59.106.194.19
54.239.39.102
52.95.120.34
176.32.108.185
39.106.173.98
47.93.194.183
210.129.151.129
52.95.116.114
52.95.120.36
54.239.33.83
64.30.228.81
151.101.64.64
151.101.192.64
151.101.0.64
151.101.128.64
42.156.141.17
104.18.130.108
104.18.132.108
104.18.131.108
104.18.133.108
104.18.134.108
54.239.34.171
178.236.7.220
54.239.33.58
151.101.193.185
151.101.129.185
151.101.1.185
151.101.65.185
145.239.9.15
94.100.180.138
217.69.139.112
185.30.176.202
56.0.141.25
56.0.82.25
103.252.142.19
103.252.142.21
103.252.142.18
151.101.66.166
151.101.130.166
151.101.2.166
151.101.194.166
151.101.192.217
151.101.0.217
151.101.128.217
151.101.64.217
52.85.252.215
52.85.252.191
52.85.252.152
52.85.252.151
219.136.245.40
104.25.237.22
104.25.236.22
52.119.164.121
52.119.161.5
52.119.168.48
36.86.63.186
125.90.93.20
169.45.207.192
96.114.14.140
68.87.41.40
96.114.21.40
200.44.167.4
200.44.167.5
198.143.164.252
151.101.192.207
151.101.128.207
151.101.64.207
151.101.0.207
151.101.0.175
151.101.128.175
151.101.64.175
151.101.192.175
52.95.116.115
52.95.120.67
54.239.33.92
68.233.77.233
104.196.156.152
104.16.2.248
104.16.5.248
104.16.3.248
104.16.1.248
104.16.4.248
104.16.213.100
104.16.210.100
104.16.212.100
104.16.211.100
104.16.209.100
123.103.5.94
66.218.87.12
106.10.218.150
67.195.231.10
188.125.72.165
124.108.115.87
143.166.135.105
143.166.147.101
208.80.48.175
204.63.46.18
81.19.82.10
81.19.82.11
81.19.82.8
81.19.82.9
153.2.224.50
153.2.228.50
51.255.67.74
37.187.137.67
149.202.206.99
103.24.8.4
182.253.240.18
202.80.220.218
202.80.220.213
195.128.8.134
193.164.196.82
193.164.197.82
203.104.138.138
61.135.218.27
61.135.218.30
198.81.200.2
204.74.99.100
204.63.46.161
204.63.46.160
208.66.216.160
208.66.216.161
208.80.48.160
208.80.48.161
193.110.128.82
52.95.120.38
52.95.116.112
54.239.33.90
52.19.167.6
161.202.24.162
119.81.119.5
81.19.73.8
81.19.83.8
81.19.73.9
81.19.83.9
104.17.203.121
104.17.206.121
104.17.202.121
104.17.205.121
104.17.204.121
216.87.148.114
153.2.242.115
153.2.244.155
104.25.211.116
104.25.212.116
64.12.51.132
205.188.157.232
207.200.73.80
64.236.1.107
159.54.242.176
104.20.59.198
104.20.60.198
216.33.197.78
209.225.49.78
213.92.16.101
192.0.79.33
192.0.79.32
87.250.251.105
213.180.193.105
209.40.98.46
161.170.230.170
161.170.239.170
161.170.232.170
72.246.101.185
46.105.50.248
163.53.78.128
68.71.245.5
54.165.95.219
54.191.191.127
92.122.206.69
92.122.206.83
95.211.7.132
74.115.50.110
74.115.50.109
98.136.103.26
124.108.115.103
212.82.100.153
74.6.136.153
106.10.248.153
216.18.168.124
2.16.84.207
198.11.132.23
205.204.101.42
52.85.201.207
140.112.172.3
140.112.172.4
140.112.172.1
140.112.172.5
140.112.172.2
140.112.172.11
192.193.218.80
192.193.102.176
203.12.21.11
203.12.21.5
104.31.70.87
104.31.71.87
80.82.77.69
123.206.6.193
125.209.214.79
210.210.24.66
104.16.55.215
104.16.52.215
104.16.54.215
104.16.56.215
104.16.53.215
192.124.249.158
67.199.248.14
67.199.248.15
212.224.112.193
91.228.155.94
91.228.155.121
35.186.213.112
104.16.242.112
104.16.241.112
104.16.239.112
104.16.238.112
104.16.240.112
143.166.82.251
143.166.82.252
143.166.224.3
143.166.224.11
143.166.83.13
143.166.224.235
104.20.68.102
104.20.69.102
132.188.92.132
52.77.194.240
216.105.38.13
74.113.233.77
124.243.204.202
23.214.153.51
144.121.138.34
144.121.138.33
161.225.203.239
209.200.152.198
194.150.248.33
183.110.0.151
183.110.0.23
216.151.17.130
104.18.67.52
104.18.71.52
104.18.68.52
104.18.70.52
104.18.69.52
151.101.66.202
151.101.2.202
151.101.130.202
151.101.194.202
104.24.30.48
104.24.31.48
47.52.174.174
47.52.153.161
54.247.118.82
103.24.8.11
103.24.8.20
103.24.8.10
138.101.9.100
109.26.209.20
2.17.233.115
64.191.16.50
151.101.129.184
151.101.65.184
151.101.1.184
151.101.193.184
104.86.110.19
104.86.110.41
82.165.229.138
82.165.230.17
104.103.177.67
23.43.29.100
188.42.162.193
88.85.82.180
194.187.98.176
104.25.204.29
104.25.205.29
212.82.100.151
124.108.115.101
98.136.103.24
74.6.136.151
106.10.248.151
47.95.170.110
212.101.122.34
104.20.0.156
104.20.68.156
182.253.240.27
182.253.240.28
151.101.128.194
151.101.192.194
151.101.64.194
151.101.0.194
151.101.38.89
202.80.220.78
202.80.220.88
202.80.220.58
202.147.199.228
216.228.121.209
204.155.149.42
204.155.149.43
204.155.146.95
204.155.149.41
95.163.95.149
95.163.95.169
95.163.94.199
95.163.94.239
95.163.95.9
95.163.95.29
95.163.95.59
95.163.95.109
95.163.95.129
113.217.247.100
155.199.192.111
155.199.32.138
155.199.64.173
155.199.80.173
216.211.130.168
213.180.141.140
216.35.221.76
210.189.86.12
194.50.69.124
91.211.75.124
13.64.188.167
52.174.24.83
42.236.9.70
208.88.227.170
72.233.72.153
78.140.185.31
198.11.188.13
198.11.188.78
31.222.66.32
31.222.66.33
84.47.177.238
83.69.196.149
95.163.94.128
83.69.196.150
178.159.255.34
175.126.117.211
1.255.89.11
113.217.247.73
117.78.42.66
205.201.132.96
210.51.19.63
5.134.210.134
104.27.215.28
104.27.214.28
122.147.53.67
209.225.49.79
216.33.197.79
178.248.233.32
172.64.137.6
172.64.136.6
192.223.136.36
192.223.170.166
192.223.189.182
221.143.22.47
176.53.93.6
34.240.50.238
52.17.216.239
54.154.100.48
59.151.5.6
104.27.155.203
104.27.154.203
94.247.132.236
94.247.132.237
94.247.132.238
144.160.155.43
144.160.36.42
98.124.199.35
104.27.158.148
104.27.159.148
185.94.84.100
151.101.37.194
23.0.45.84
52.42.223.201
35.164.25.103
104.25.65.8
104.25.64.8
23.54.138.233
192.16.16.5
192.16.16.6
198.7.29.5
198.7.29.6
23.62.99.58
23.62.99.66
54.88.196.117
52.206.66.47
213.180.128.240
213.180.128.242
213.180.137.160
213.180.147.200
162.212.41.11
195.82.146.214
104.24.29.35
104.24.28.35
5.11.81.144
5.11.87.101
104.16.253.5
104.16.251.5
104.16.252.5
104.16.249.5
104.16.250.5
205.153.36.175
209.144.103.30
210.189.86.9
61.211.236.1
133.167.21.1
185.37.100.123
172.64.101.2
172.64.100.2
216.18.168.66
104.24.255.11
104.24.254.11
104.18.215.186
104.18.218.186
104.18.217.186
104.18.216.186
104.18.214.186
72.166.186.169
74.113.188.100
118.102.1.119
185.53.36.101
148.251.77.209
211.231.108.151
208.43.60.11
67.228.27.109
75.126.182.36
67.228.27.112
67.228.27.111
75.126.182.37
50.22.67.98
67.228.27.113
75.126.123.82
75.126.182.35
67.228.27.100
67.228.27.110
23.212.234.129
94.124.200.86
104.20.68.21
104.20.67.21
104.17.252.23
104.17.1.24
104.17.255.23
104.17.254.23
104.17.253.23
192.0.72.3
46.166.188.38
46.166.188.35
46.166.188.36
46.166.188.37
194.50.69.18
91.211.75.18
5.187.1.122
151.101.2.114
151.101.66.114
151.101.130.114
151.101.194.114
92.62.130.180
104.25.232.115
104.25.231.115
2.19.61.89
104.20.35.236
104.20.34.236
104.17.108.49
104.17.110.49
104.17.111.49
104.17.107.49
104.17.109.49
192.107.237.22
104.27.150.190
104.27.151.190
104.103.185.202
195.154.120.129
34.206.170.76
52.3.40.255
185.94.140.30
95.100.97.6
95.100.97.9
212.96.161.229
185.189.92.41
104.17.227.106
104.17.230.106
104.17.231.106
104.17.228.106
104.17.229.106
172.64.139.6
172.64.138.6
104.23.131.67
104.23.132.67
198.41.214.162
198.41.215.162
162.208.32.99
172.64.194.2
172.64.195.2
208.51.38.241
72.247.179.123
72.247.179.145
185.72.229.13
80.68.253.13
185.44.0.16
185.44.0.26
185.44.0.36
195.211.221.116
140.205.34.12
140.205.32.13
140.205.172.20
140.205.172.21
140.205.230.3
104.25.186.6
104.25.187.6
103.6.182.20
115.112.203.158
185.89.12.132
104.25.96.28
104.25.97.28
2.19.58.126
104.25.116.113
104.25.115.113
5.39.224.140
104.82.101.211
104.25.15.31
104.25.14.31
104.20.31.186
104.20.30.186
223.165.27.146
104.81.108.67
104.31.19.30
104.31.18.30
159.203.157.16
104.25.80.106
104.25.79.106
104.86.110.146
104.86.110.136
204.155.151.79
204.155.151.80
195.128.8.101
193.110.128.109
104.20.42.98
104.20.41.98
104.20.223.36
104.20.222.36
173.0.157.59
195.78.85.110
2.20.36.80
212.31.252.70
81.19.72.0
81.19.72.1
81.19.72.2
81.19.72.5
81.19.72.3
81.19.72.4
52.204.232.145
52.70.114.30
52.200.12.129
52.20.198.134
52.22.135.100
52.200.202.27
52.70.238.183
216.146.46.11
216.146.46.10
192.30.253.113
192.30.253.112
162.125.248.1
54.243.75.57
107.21.237.154
184.72.217.110
107.21.219.180
104.20.42.23
104.20.41.23
93.93.53.190
143.204.101.65
143.204.101.90
143.204.101.8
143.204.101.13
192.0.66.2
104.82.122.154
52.84.150.31
52.84.150.27
52.84.150.26
52.84.150.11
192.229.189.15
192.229.162.112
192.229.182.112
34.235.56.176
52.7.178.92
5.255.255.5
77.88.55.55
143.204.101.20
143.204.101.55
143.204.101.49
143.204.101.118
79.125.105.113
46.51.179.90
176.34.155.23
52.72.26.162
143.204.101.32
143.204.101.122
143.204.101.9
85.111.27.87
216.18.168.116
87.250.255.11
151.101.1.164
151.101.65.164
151.101.193.164
151.101.129.164
52.17.127.232
34.252.174.246
104.103.157.249
13.228.90.128
40.115.23.107
23.201.103.27
23.201.103.32
80.68.247.10
80.68.253.26
185.166.140.55
185.166.140.56
185.166.140.57
1.201.140.237
1.201.136.217
50.19.82.148
185.44.0.100
93.191.15.17
104.103.245.153
137.188.80.90
162.115.208.90
162.115.16.90
143.204.101.10
143.204.101.88
143.204.101.123
91.197.44.119
91.197.44.118
91.197.44.117
91.197.44.12
91.197.45.4
104.20.83.194
104.20.82.194
216.18.168.52
104.20.26.96
104.20.27.96
209.68.24.127
64.130.3.227
184.154.69.154
143.204.101.25
143.204.101.50
93.93.68.145
193.34.169.16
143.204.101.121
143.204.101.107
143.204.101.64
143.204.101.119
23.212.234.145
54.84.118.104
54.89.68.232
204.62.115.78
107.178.245.188
52.25.109.230
23.64.224.246
106.11.35.30
106.11.35.29
140.205.71.248
42.156.241.248
140.205.2.187
198.11.138.248
81.171.123.200
52.2.61.110
202.6.246.33
104.82.127.147
52.45.55.52
52.72.138.32
52.45.70.146
104.16.146.241
104.16.147.241
193.28.225.200
192.147.130.204
193.104.215.58
216.115.208.241
143.204.101.39
143.204.101.29
143.204.101.12
104.103.122.31
13.250.72.180
52.76.136.196
192.33.31.161
178.252.170.252
185.167.72.20
178.248.233.26
200.12.18.22
153.254.147.65
208.94.152.100
208.94.153.100
77.234.45.78
77.234.41.52
77.234.42.85
77.234.43.52
90.216.129.62
143.204.93.160
52.6.169.224
52.73.32.25
34.199.29.248
52.206.161.135
54.175.117.186
54.174.45.144
104.82.109.157
143.204.95.200
52.220.249.13
54.251.160.113
104.82.129.222
104.16.83.211
104.16.82.211
104.16.85.211
104.16.84.211
104.16.81.211
199.182.50.57
199.182.50.58
185.165.123.77
54.163.247.71
178.33.63.127
104.103.200.178
52.73.212.201
54.236.228.139
52.22.5.243
34.192.57.190
104.20.137.61
104.20.136.61
208.75.122.14
119.254.76.148
18.234.20.180
18.234.20.188
18.234.20.183
195.8.215.136
203.130.48.145
203.130.48.144
185.167.72.25
31.184.129.25
85.185.91.135
54.194.188.213
52.48.206.211
52.31.135.201
34.255.78.62
54.164.99.138
54.164.30.188
23.212.234.230
172.64.201.3
172.64.200.3
195.93.246.187
195.93.246.212
104.25.117.119
104.25.118.119
104.103.122.109
104.31.75.39
104.31.74.39
151.101.129.84
151.101.65.84
151.101.1.84
151.101.193.84
47.89.133.85
104.20.60.241
104.20.59.241
155.64.49.54
155.64.16.51
34.252.28.153
52.31.87.113
54.246.171.232
183.56.150.155
113.107.238.14
119.147.33.33
113.105.73.141
183.56.150.142
113.107.238.27
113.107.238.12
113.107.238.15
119.147.253.25
113.107.238.11
113.105.73.148
119.147.33.36
183.56.150.144
113.105.73.142
183.56.150.146
119.147.253.23
92.122.17.185
185.6.169.69
104.27.241.252
104.27.240.252
104.103.189.23
185.7.96.91
95.211.208.200
185.7.96.90
95.211.208.208
2.19.56.60
104.17.81.135
104.17.79.135
104.17.78.135
104.17.80.135
104.17.77.135
104.81.101.129
185.42.236.11
35.201.234.200
5.63.150.180
143.204.101.93
143.204.101.91
143.204.101.100
45.60.149.132
45.60.169.132
202.6.246.32
52.30.238.17
52.19.40.147
52.17.27.129
52.214.179.84
52.17.227.174
52.19.113.209
52.17.14.18
54.171.187.60
184.72.124.184
200.12.17.253
200.12.23.250
200.12.18.250
200.12.22.250
54.174.214.170
34.225.40.45
54.215.201.153
54.219.161.51
54.193.75.88
54.193.54.141
54.67.36.238
52.8.60.202
54.67.36.100
54.215.226.128
151.101.65.67
151.101.193.67
151.101.129.67
151.101.1.67
143.204.93.223
151.101.1.177
151.101.193.177
151.101.65.177
151.101.129.177
13.114.118.178
52.199.111.149
104.127.209.4
54.86.74.191
34.206.16.240
185.235.236.196
54.148.168.222
52.11.155.253
143.204.101.63
143.204.101.87
143.204.101.42
151.101.1.28
151.101.129.28
151.101.193.28
151.101.65.28
69.147.88.7
69.147.92.11
103.6.0.121
103.6.0.120
23.33.90.138
143.204.101.35
13.115.18.61
13.230.115.161
52.33.182.156
54.213.36.26
54.254.176.158
52.74.158.163
207.229.73.118
207.229.73.117
111.65.248.132
52.76.227.95
52.76.255.100
104.16.43.64
104.16.44.64
188.72.213.123
188.72.213.122
188.72.213.121
210.144.64.76
210.144.64.77
208.94.152.190
208.94.153.190
75.125.29.226
77.234.47.13
91.213.143.1
91.213.143.11
34.255.51.249
52.213.29.106
109.169.55.249
52.54.227.239
52.7.205.218
54.89.30.61
87.248.116.13
87.248.116.14
23.251.125.131
23.251.124.131
23.251.126.133
118.191.216.57
118.191.216.42
119.235.235.13
117.18.232.133
202.108.33.60
202.108.33.107
45.249.212.124
174.143.228.153
200.201.165.253
200.201.172.223
200.201.166.253
200.201.171.223
202.108.8.82
42.81.62.213
200.147.67.142
122.70.142.183
43.243.234.234
111.206.239.19
140.98.193.152
122.147.226.250
147.67.119.170
147.67.136.60
147.67.136.135
147.67.136.170
147.67.119.60
147.67.119.135
103.93.210.60
103.93.211.60
219.153.58.101
111.11.31.225
203.104.137.1
203.104.137.9
35.163.23.137
54.71.250.83
23.111.87.204
23.111.87.84
188.42.138.164
188.42.131.12
188.42.138.156
188.42.137.132
188.42.131.20
188.42.140.108
188.42.141.36
23.111.229.124
188.42.140.100
23.111.87.220
188.42.137.140
23.56.223.12
108.60.221.55
108.60.221.54
108.60.221.56
108.60.221.53
192.170.156.116
151.101.193.5
151.101.1.5
151.101.129.5
151.101.65.5
54.169.61.9
52.76.24.232
54.210.89.130
34.205.49.39
34.196.141.117
107.23.174.153
54.88.21.90
114.134.80.162
143.204.101.15
143.204.101.74
143.204.101.127
143.204.101.96
18.234.32.155
18.234.32.156
18.234.32.157
146.255.192.77
146.255.192.75
151.101.194.217
151.101.2.217
151.101.130.217
151.101.66.217
202.130.245.42
202.106.184.166
61.172.201.254
123.125.29.99
121.14.1.22
45.249.212.230
116.66.184.201
206.16.17.219
122.96.104.66
185.176.76.229
104.153.64.122
115.159.231.173
72.3.172.249
72.3.172.250
34.198.18.191
34.192.165.114
52.36.105.169
34.217.162.58
205.203.139.53
54.94.215.89
54.94.162.238
54.94.183.198
18.231.12.180
202.239.30.129
170.167.117.81
107.154.102.99
36.51.254.228
36.51.254.229
111.13.101.208
123.125.114.144
180.149.132.47
220.181.57.217
151.101.66.110
151.101.130.110
151.101.2.110
151.101.194.110
101.227.188.172
101.227.188.174
101.227.188.176
101.227.188.178
101.227.188.170
54.88.155.189
54.84.219.225
54.191.45.214
54.191.118.141
143.204.101.125
143.204.101.71
143.204.101.23
143.204.101.80
143.204.101.56
143.204.101.69
143.204.101.82
34.203.199.183
104.27.100.99
104.27.101.99
38.27.97.23
176.56.156.136
176.56.156.137
85.111.56.8
202.129.216.26
143.204.101.75
143.204.101.84
52.74.223.93
68.169.89.142
54.173.174.87
200.201.172.21
200.201.171.21
200.201.161.23
200.201.161.22
216.33.197.90
209.225.49.90
106.75.32.98
180.97.180.206
58.216.22.26
60.222.200.121
220.194.200.67
42.62.30.180
124.243.192.30
203.93.27.6
203.93.27.7
219.141.244.3
182.92.20.91
118.191.216.61
123.126.51.12
180.149.156.12
202.99.16.4
42.81.124.83
60.28.251.1
59.173.14.26
104.20.9.75
104.20.10.75
200.147.38.8
200.147.255.105
200.221.11.98
223.223.182.226
182.48.113.104
182.48.117.205
117.25.139.69
140.98.193.128
63.84.220.182
208.99.166.238
58.218.204.252
113.31.88.229
113.31.88.230
220.228.205.189
61.219.52.126
147.67.250.2
147.67.12.2
147.67.250.3
147.67.12.3
208.109.192.71
104.238.65.190
121.29.18.27
67.43.7.192
118.184.184.70
103.93.210.253
103.93.211.253
188.166.180.242
128.199.167.249
58.83.160.155
58.83.160.156
176.53.59.98
176.53.59.96
176.53.59.97
182.92.20.106
118.89.206.145
202.108.119.193
202.108.119.194
151.101.36.144
162.159.229.132
162.159.228.132
113.204.98.131
219.153.58.174
222.177.27.240
122.70.135.62
60.28.222.5
42.62.27.63
218.30.118.208
106.120.167.69
45.61.5.241
45.61.5.242
45.61.5.243
45.61.5.244
180.101.38.35
180.76.76.118
119.75.222.16
61.135.165.228
220.181.38.72
111.206.37.209
119.75.222.15
61.135.165.227
124.250.72.168
101.37.178.168
40.114.244.193
157.185.149.167
180.153.106.86
180.153.106.87
\.


--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 199
-- Name: domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.domain_id_seq', 1349, true);


--
-- TOC entry 2775 (class 2606 OID 24630)
-- Name: domain_ip domain_ip_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.domain_ip
    ADD CONSTRAINT domain_ip_pkey PRIMARY KEY (domain_id, ip);


--
-- TOC entry 2771 (class 2606 OID 24623)
-- Name: domain domain_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.domain
    ADD CONSTRAINT domain_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 24637)
-- Name: ip_address ip_address_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ip_address
    ADD CONSTRAINT ip_address_pkey PRIMARY KEY (ip);


--
-- TOC entry 2772 (class 1259 OID 24625)
-- Name: idx_a7a91e0be014210b; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_a7a91e0be014210b ON public.domain USING btree (parent_domain_id);


--
-- TOC entry 2776 (class 1259 OID 24631)
-- Name: idx_b85da98115f0ee5; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_b85da98115f0ee5 ON public.domain_ip USING btree (domain_id);


--
-- TOC entry 2777 (class 1259 OID 24632)
-- Name: idx_b85da98a5e3b32d; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX idx_b85da98a5e3b32d ON public.domain_ip USING btree (ip);


--
-- TOC entry 2773 (class 1259 OID 24624)
-- Name: uniq_a7a91e0ba7a91e0b; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX uniq_a7a91e0ba7a91e0b ON public.domain USING btree (domain);


--
-- TOC entry 2780 (class 2606 OID 24640)
-- Name: domain fk_a7a91e0be014210b; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.domain
    ADD CONSTRAINT fk_a7a91e0be014210b FOREIGN KEY (parent_domain_id) REFERENCES public.domain(id);


--
-- TOC entry 2781 (class 2606 OID 24645)
-- Name: domain_ip fk_b85da98115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.domain_ip
    ADD CONSTRAINT fk_b85da98115f0ee5 FOREIGN KEY (domain_id) REFERENCES public.domain(id);


--
-- TOC entry 2782 (class 2606 OID 24650)
-- Name: domain_ip fk_b85da98a5e3b32d; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.domain_ip
    ADD CONSTRAINT fk_b85da98a5e3b32d FOREIGN KEY (ip) REFERENCES public.ip_address(ip);


-- Completed on 2019-03-10 15:32:51 EET

--
-- PostgreSQL database dump complete
--

