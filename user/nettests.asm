
user/_nettests:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <decode_qname>:
}

// Decode a DNS name
static void
decode_qname(char *qn)
{
   0:	1141                	addi	sp,sp,-16
   2:	e422                	sd	s0,8(sp)
   4:	0800                	addi	s0,sp,16
  while(*qn != '\0') {
   6:	00054783          	lbu	a5,0(a0)
    int l = *qn;
   a:	0007861b          	sext.w	a2,a5
    if(l == 0)
      break;
    for(int i = 0; i < l; i++) {
   e:	4581                	li	a1,0
  10:	4885                	li	a7,1
      *qn = *(qn+1);
      qn++;
    }
    *qn++ = '.';
  12:	02e00813          	li	a6,46
  while(*qn != '\0') {
  16:	ef81                	bnez	a5,2e <decode_qname+0x2e>
  }
}
  18:	6422                	ld	s0,8(sp)
  1a:	0141                	addi	sp,sp,16
  1c:	8082                	ret
    *qn++ = '.';
  1e:	0709                	addi	a4,a4,2
  20:	953a                	add	a0,a0,a4
  22:	01078023          	sb	a6,0(a5)
  while(*qn != '\0') {
  26:	0017c603          	lbu	a2,1(a5)
  2a:	d67d                	beqz	a2,18 <decode_qname+0x18>
    int l = *qn;
  2c:	2601                	sext.w	a2,a2
{
  2e:	87aa                	mv	a5,a0
    for(int i = 0; i < l; i++) {
  30:	872e                	mv	a4,a1
      *qn = *(qn+1);
  32:	0017c683          	lbu	a3,1(a5)
  36:	00d78023          	sb	a3,0(a5)
      qn++;
  3a:	0785                	addi	a5,a5,1
    for(int i = 0; i < l; i++) {
  3c:	2705                	addiw	a4,a4,1
  3e:	fec74ae3          	blt	a4,a2,32 <decode_qname+0x32>
  42:	fff6069b          	addiw	a3,a2,-1
  46:	1682                	slli	a3,a3,0x20
  48:	9281                	srli	a3,a3,0x20
  4a:	87c6                	mv	a5,a7
  4c:	00c05463          	blez	a2,54 <decode_qname+0x54>
  50:	00168793          	addi	a5,a3,1
  54:	97aa                	add	a5,a5,a0
    *qn++ = '.';
  56:	872e                	mv	a4,a1
  58:	fcc053e3          	blez	a2,1e <decode_qname+0x1e>
  5c:	8736                	mv	a4,a3
  5e:	b7c1                	j	1e <decode_qname+0x1e>

0000000000000060 <ping>:
{
  60:	7131                	addi	sp,sp,-192
  62:	fd06                	sd	ra,184(sp)
  64:	f922                	sd	s0,176(sp)
  66:	f526                	sd	s1,168(sp)
  68:	f14a                	sd	s2,160(sp)
  6a:	ed4e                	sd	s3,152(sp)
  6c:	0180                	addi	s0,sp,192
  6e:	89b2                	mv	s3,a2
  char obuf[13] = "hello world!";
  70:	00001797          	auipc	a5,0x1
  74:	f1078793          	addi	a5,a5,-240 # f80 <malloc+0x154>
  78:	6398                	ld	a4,0(a5)
  7a:	fce43023          	sd	a4,-64(s0)
  7e:	4798                	lw	a4,8(a5)
  80:	fce42423          	sw	a4,-56(s0)
  84:	00c7c783          	lbu	a5,12(a5)
  88:	fcf40623          	sb	a5,-52(s0)
  if((fd = connect(dst, sport, dport)) < 0){
  8c:	862e                	mv	a2,a1
  8e:	85aa                	mv	a1,a0
  90:	0a000537          	lui	a0,0xa000
  94:	20250513          	addi	a0,a0,514 # a000202 <__global_pointer$+0x9ffe8a1>
  98:	00001097          	auipc	ra,0x1
  9c:	9ee080e7          	jalr	-1554(ra) # a86 <connect>
  a0:	06054763          	bltz	a0,10e <ping+0xae>
  a4:	892a                	mv	s2,a0
  for(int i = 0; i < attempts; i++) {
  a6:	4481                	li	s1,0
  a8:	01305f63          	blez	s3,c6 <ping+0x66>
    if(write(fd, obuf, sizeof(obuf)) < 0){
  ac:	4635                	li	a2,13
  ae:	fc040593          	addi	a1,s0,-64
  b2:	854a                	mv	a0,s2
  b4:	00001097          	auipc	ra,0x1
  b8:	952080e7          	jalr	-1710(ra) # a06 <write>
  bc:	06054763          	bltz	a0,12a <ping+0xca>
  for(int i = 0; i < attempts; i++) {
  c0:	2485                	addiw	s1,s1,1
  c2:	fe9995e3          	bne	s3,s1,ac <ping+0x4c>
  int cc = read(fd, ibuf, sizeof(ibuf));
  c6:	08000613          	li	a2,128
  ca:	f4040593          	addi	a1,s0,-192
  ce:	854a                	mv	a0,s2
  d0:	00001097          	auipc	ra,0x1
  d4:	92e080e7          	jalr	-1746(ra) # 9fe <read>
  d8:	84aa                	mv	s1,a0
  if(cc < 0){
  da:	06054663          	bltz	a0,146 <ping+0xe6>
  close(fd);
  de:	854a                	mv	a0,s2
  e0:	00001097          	auipc	ra,0x1
  e4:	92e080e7          	jalr	-1746(ra) # a0e <close>
  if (strcmp(obuf, ibuf) || cc != sizeof(obuf)){
  e8:	f4040593          	addi	a1,s0,-192
  ec:	fc040513          	addi	a0,s0,-64
  f0:	00000097          	auipc	ra,0x0
  f4:	69c080e7          	jalr	1692(ra) # 78c <strcmp>
  f8:	e52d                	bnez	a0,162 <ping+0x102>
  fa:	47b5                	li	a5,13
  fc:	06f49363          	bne	s1,a5,162 <ping+0x102>
}
 100:	70ea                	ld	ra,184(sp)
 102:	744a                	ld	s0,176(sp)
 104:	74aa                	ld	s1,168(sp)
 106:	790a                	ld	s2,160(sp)
 108:	69ea                	ld	s3,152(sp)
 10a:	6129                	addi	sp,sp,192
 10c:	8082                	ret
    fprintf(2, "ping: connect() failed\n");
 10e:	00001597          	auipc	a1,0x1
 112:	e0258593          	addi	a1,a1,-510 # f10 <malloc+0xe4>
 116:	4509                	li	a0,2
 118:	00001097          	auipc	ra,0x1
 11c:	c28080e7          	jalr	-984(ra) # d40 <fprintf>
    exit(1);
 120:	4505                	li	a0,1
 122:	00001097          	auipc	ra,0x1
 126:	8c4080e7          	jalr	-1852(ra) # 9e6 <exit>
      fprintf(2, "ping: send() failed\n");
 12a:	00001597          	auipc	a1,0x1
 12e:	dfe58593          	addi	a1,a1,-514 # f28 <malloc+0xfc>
 132:	4509                	li	a0,2
 134:	00001097          	auipc	ra,0x1
 138:	c0c080e7          	jalr	-1012(ra) # d40 <fprintf>
      exit(1);
 13c:	4505                	li	a0,1
 13e:	00001097          	auipc	ra,0x1
 142:	8a8080e7          	jalr	-1880(ra) # 9e6 <exit>
    fprintf(2, "ping: recv() failed\n");
 146:	00001597          	auipc	a1,0x1
 14a:	dfa58593          	addi	a1,a1,-518 # f40 <malloc+0x114>
 14e:	4509                	li	a0,2
 150:	00001097          	auipc	ra,0x1
 154:	bf0080e7          	jalr	-1040(ra) # d40 <fprintf>
    exit(1);
 158:	4505                	li	a0,1
 15a:	00001097          	auipc	ra,0x1
 15e:	88c080e7          	jalr	-1908(ra) # 9e6 <exit>
    fprintf(2, "ping didn't receive correct payload\n");
 162:	00001597          	auipc	a1,0x1
 166:	df658593          	addi	a1,a1,-522 # f58 <malloc+0x12c>
 16a:	4509                	li	a0,2
 16c:	00001097          	auipc	ra,0x1
 170:	bd4080e7          	jalr	-1068(ra) # d40 <fprintf>
    exit(1);
 174:	4505                	li	a0,1
 176:	00001097          	auipc	ra,0x1
 17a:	870080e7          	jalr	-1936(ra) # 9e6 <exit>

000000000000017e <dns>:
  }
}

static void
dns()
{
 17e:	7119                	addi	sp,sp,-128
 180:	fc86                	sd	ra,120(sp)
 182:	f8a2                	sd	s0,112(sp)
 184:	f4a6                	sd	s1,104(sp)
 186:	f0ca                	sd	s2,96(sp)
 188:	ecce                	sd	s3,88(sp)
 18a:	e8d2                	sd	s4,80(sp)
 18c:	e4d6                	sd	s5,72(sp)
 18e:	e0da                	sd	s6,64(sp)
 190:	fc5e                	sd	s7,56(sp)
 192:	f862                	sd	s8,48(sp)
 194:	f466                	sd	s9,40(sp)
 196:	f06a                	sd	s10,32(sp)
 198:	ec6e                	sd	s11,24(sp)
 19a:	0100                	addi	s0,sp,128
 19c:	83010113          	addi	sp,sp,-2000
  uint8 ibuf[N];
  uint32 dst;
  int fd;
  int len;

  memset(obuf, 0, N);
 1a0:	3e800613          	li	a2,1000
 1a4:	4581                	li	a1,0
 1a6:	ba840513          	addi	a0,s0,-1112
 1aa:	00000097          	auipc	ra,0x0
 1ae:	638080e7          	jalr	1592(ra) # 7e2 <memset>
  memset(ibuf, 0, N);
 1b2:	3e800613          	li	a2,1000
 1b6:	4581                	li	a1,0
 1b8:	77fd                	lui	a5,0xfffff
 1ba:	7c078793          	addi	a5,a5,1984 # fffffffffffff7c0 <__global_pointer$+0xffffffffffffde5f>
 1be:	00f40533          	add	a0,s0,a5
 1c2:	00000097          	auipc	ra,0x0
 1c6:	620080e7          	jalr	1568(ra) # 7e2 <memset>
  
  // 8.8.8.8: google's name server
  dst = (8 << 24) | (8 << 16) | (8 << 8) | (8 << 0);

  if((fd = connect(dst, 10000, 53)) < 0){
 1ca:	03500613          	li	a2,53
 1ce:	6589                	lui	a1,0x2
 1d0:	71058593          	addi	a1,a1,1808 # 2710 <__global_pointer$+0xdaf>
 1d4:	08081537          	lui	a0,0x8081
 1d8:	80850513          	addi	a0,a0,-2040 # 8080808 <__global_pointer$+0x807eea7>
 1dc:	00001097          	auipc	ra,0x1
 1e0:	8aa080e7          	jalr	-1878(ra) # a86 <connect>
 1e4:	02054d63          	bltz	a0,21e <dns+0xa0>
 1e8:	892a                	mv	s2,a0
  hdr->id = htons(6828);
 1ea:	77ed                	lui	a5,0xffffb
 1ec:	c1a78793          	addi	a5,a5,-998 # ffffffffffffac1a <__global_pointer$+0xffffffffffff92b9>
 1f0:	baf41423          	sh	a5,-1112(s0)
  hdr->rd = 1;
 1f4:	baa45783          	lhu	a5,-1110(s0)
 1f8:	0017e793          	ori	a5,a5,1
 1fc:	baf41523          	sh	a5,-1110(s0)
  hdr->qdcount = htons(1);
 200:	10000793          	li	a5,256
 204:	baf41623          	sh	a5,-1108(s0)
  for(char *c = host; c < host+strlen(host)+1; c++) {
 208:	00001497          	auipc	s1,0x1
 20c:	d8848493          	addi	s1,s1,-632 # f90 <malloc+0x164>
  char *l = host; 
 210:	8a26                	mv	s4,s1
  for(char *c = host; c < host+strlen(host)+1; c++) {
 212:	bb440993          	addi	s3,s0,-1100
 216:	8aa6                	mv	s5,s1
    if(*c == '.') {
 218:	02e00b13          	li	s6,46
  for(char *c = host; c < host+strlen(host)+1; c++) {
 21c:	a01d                	j	242 <dns+0xc4>
    fprintf(2, "ping: connect() failed\n");
 21e:	00001597          	auipc	a1,0x1
 222:	cf258593          	addi	a1,a1,-782 # f10 <malloc+0xe4>
 226:	4509                	li	a0,2
 228:	00001097          	auipc	ra,0x1
 22c:	b18080e7          	jalr	-1256(ra) # d40 <fprintf>
    exit(1);
 230:	4505                	li	a0,1
 232:	00000097          	auipc	ra,0x0
 236:	7b4080e7          	jalr	1972(ra) # 9e6 <exit>
      *qn++ = (char) (c-l);
 23a:	89b6                	mv	s3,a3
      l = c+1; // skip .
 23c:	00148a13          	addi	s4,s1,1
  for(char *c = host; c < host+strlen(host)+1; c++) {
 240:	0485                	addi	s1,s1,1
 242:	8556                	mv	a0,s5
 244:	00000097          	auipc	ra,0x0
 248:	574080e7          	jalr	1396(ra) # 7b8 <strlen>
 24c:	1502                	slli	a0,a0,0x20
 24e:	9101                	srli	a0,a0,0x20
 250:	0505                	addi	a0,a0,1
 252:	9556                	add	a0,a0,s5
 254:	02a4fc63          	bgeu	s1,a0,28c <dns+0x10e>
    if(*c == '.') {
 258:	0004c783          	lbu	a5,0(s1)
 25c:	ff6792e3          	bne	a5,s6,240 <dns+0xc2>
      *qn++ = (char) (c-l);
 260:	00198693          	addi	a3,s3,1
 264:	414487b3          	sub	a5,s1,s4
 268:	00f98023          	sb	a5,0(s3)
      for(char *d = l; d < c; d++) {
 26c:	fc9a77e3          	bgeu	s4,s1,23a <dns+0xbc>
 270:	87d2                	mv	a5,s4
      *qn++ = (char) (c-l);
 272:	8736                	mv	a4,a3
        *qn++ = *d;
 274:	0705                	addi	a4,a4,1
 276:	0007c603          	lbu	a2,0(a5)
 27a:	fec70fa3          	sb	a2,-1(a4)
      for(char *d = l; d < c; d++) {
 27e:	0785                	addi	a5,a5,1
 280:	fef49ae3          	bne	s1,a5,274 <dns+0xf6>
 284:	414489b3          	sub	s3,s1,s4
 288:	99b6                	add	s3,s3,a3
 28a:	bf4d                	j	23c <dns+0xbe>
  *qn = '\0';
 28c:	00098023          	sb	zero,0(s3)
  len += strlen(qname) + 1;
 290:	bb440513          	addi	a0,s0,-1100
 294:	00000097          	auipc	ra,0x0
 298:	524080e7          	jalr	1316(ra) # 7b8 <strlen>
 29c:	0005049b          	sext.w	s1,a0
  struct dns_question *h = (struct dns_question *) (qname+strlen(qname)+1);
 2a0:	bb440513          	addi	a0,s0,-1100
 2a4:	00000097          	auipc	ra,0x0
 2a8:	514080e7          	jalr	1300(ra) # 7b8 <strlen>
 2ac:	02051793          	slli	a5,a0,0x20
 2b0:	9381                	srli	a5,a5,0x20
 2b2:	0785                	addi	a5,a5,1
 2b4:	bb440713          	addi	a4,s0,-1100
 2b8:	97ba                	add	a5,a5,a4
  h->qtype = htons(0x1);
 2ba:	00078023          	sb	zero,0(a5)
 2be:	4705                	li	a4,1
 2c0:	00e780a3          	sb	a4,1(a5)
  h->qclass = htons(0x1);
 2c4:	00078123          	sb	zero,2(a5)
 2c8:	00e781a3          	sb	a4,3(a5)
  }

  len = dns_req(obuf);
  
  if(write(fd, obuf, len) < 0){
 2cc:	0114861b          	addiw	a2,s1,17
 2d0:	ba840593          	addi	a1,s0,-1112
 2d4:	854a                	mv	a0,s2
 2d6:	00000097          	auipc	ra,0x0
 2da:	730080e7          	jalr	1840(ra) # a06 <write>
 2de:	10054e63          	bltz	a0,3fa <dns+0x27c>
    fprintf(2, "dns: send() failed\n");
    exit(1);
  }
  int cc = read(fd, ibuf, sizeof(ibuf));
 2e2:	3e800613          	li	a2,1000
 2e6:	77fd                	lui	a5,0xfffff
 2e8:	7c078793          	addi	a5,a5,1984 # fffffffffffff7c0 <__global_pointer$+0xffffffffffffde5f>
 2ec:	00f405b3          	add	a1,s0,a5
 2f0:	854a                	mv	a0,s2
 2f2:	00000097          	auipc	ra,0x0
 2f6:	70c080e7          	jalr	1804(ra) # 9fe <read>
 2fa:	89aa                	mv	s3,a0
  if(cc < 0){
 2fc:	10054d63          	bltz	a0,416 <dns+0x298>
  if(!hdr->qr) {
 300:	77fd                	lui	a5,0xfffff
 302:	7c278793          	addi	a5,a5,1986 # fffffffffffff7c2 <__global_pointer$+0xffffffffffffde61>
 306:	97a2                	add	a5,a5,s0
 308:	00078783          	lb	a5,0(a5)
 30c:	1207d363          	bgez	a5,432 <dns+0x2b4>
  if(hdr->id != htons(6828))
 310:	77fd                	lui	a5,0xfffff
 312:	7c078793          	addi	a5,a5,1984 # fffffffffffff7c0 <__global_pointer$+0xffffffffffffde5f>
 316:	97a2                	add	a5,a5,s0
 318:	0007d783          	lhu	a5,0(a5)
 31c:	0007869b          	sext.w	a3,a5
 320:	672d                	lui	a4,0xb
 322:	c1a70713          	addi	a4,a4,-998 # ac1a <__global_pointer$+0x92b9>
 326:	10e69b63          	bne	a3,a4,43c <dns+0x2be>
  if(hdr->rcode != 0) {
 32a:	777d                	lui	a4,0xfffff
 32c:	7c370793          	addi	a5,a4,1987 # fffffffffffff7c3 <__global_pointer$+0xffffffffffffde62>
 330:	97a2                	add	a5,a5,s0
 332:	0007c783          	lbu	a5,0(a5)
 336:	8bbd                	andi	a5,a5,15
 338:	12079263          	bnez	a5,45c <dns+0x2de>
// endianness support
//

static inline uint16 bswaps(uint16 val)
{
  return (((val & 0x00ffU) << 8) |
 33c:	7c470793          	addi	a5,a4,1988
 340:	97a2                	add	a5,a5,s0
 342:	0007d783          	lhu	a5,0(a5)
 346:	0087d71b          	srliw	a4,a5,0x8
 34a:	0087979b          	slliw	a5,a5,0x8
 34e:	8fd9                	or	a5,a5,a4
  for(int i =0; i < ntohs(hdr->qdcount); i++) {
 350:	17c2                	slli	a5,a5,0x30
 352:	93c1                	srli	a5,a5,0x30
 354:	4a81                	li	s5,0
  len = sizeof(struct dns);
 356:	44b1                	li	s1,12
  char *qname = 0;
 358:	4a01                	li	s4,0
  for(int i =0; i < ntohs(hdr->qdcount); i++) {
 35a:	c3b1                	beqz	a5,39e <dns+0x220>
    char *qn = (char *) (ibuf+len);
 35c:	7b7d                	lui	s6,0xfffff
 35e:	7c0b0793          	addi	a5,s6,1984 # fffffffffffff7c0 <__global_pointer$+0xffffffffffffde5f>
 362:	97a2                	add	a5,a5,s0
 364:	00978a33          	add	s4,a5,s1
    decode_qname(qn);
 368:	8552                	mv	a0,s4
 36a:	00000097          	auipc	ra,0x0
 36e:	c96080e7          	jalr	-874(ra) # 0 <decode_qname>
    len += strlen(qn)+1;
 372:	8552                	mv	a0,s4
 374:	00000097          	auipc	ra,0x0
 378:	444080e7          	jalr	1092(ra) # 7b8 <strlen>
    len += sizeof(struct dns_question);
 37c:	2515                	addiw	a0,a0,5
 37e:	9ca9                	addw	s1,s1,a0
  for(int i =0; i < ntohs(hdr->qdcount); i++) {
 380:	2a85                	addiw	s5,s5,1
 382:	7c4b0793          	addi	a5,s6,1988
 386:	97a2                	add	a5,a5,s0
 388:	0007d783          	lhu	a5,0(a5)
 38c:	0087d71b          	srliw	a4,a5,0x8
 390:	0087979b          	slliw	a5,a5,0x8
 394:	8fd9                	or	a5,a5,a4
 396:	17c2                	slli	a5,a5,0x30
 398:	93c1                	srli	a5,a5,0x30
 39a:	fcfac1e3          	blt	s5,a5,35c <dns+0x1de>
 39e:	77fd                	lui	a5,0xfffff
 3a0:	7c678793          	addi	a5,a5,1990 # fffffffffffff7c6 <__global_pointer$+0xffffffffffffde65>
 3a4:	97a2                	add	a5,a5,s0
 3a6:	0007d783          	lhu	a5,0(a5)
 3aa:	0087d71b          	srliw	a4,a5,0x8
 3ae:	0087979b          	slliw	a5,a5,0x8
 3b2:	8fd9                	or	a5,a5,a4
  for(int i = 0; i < ntohs(hdr->ancount); i++) {
 3b4:	17c2                	slli	a5,a5,0x30
 3b6:	93c1                	srli	a5,a5,0x30
 3b8:	24078663          	beqz	a5,604 <dns+0x486>
 3bc:	00001797          	auipc	a5,0x1
 3c0:	cb478793          	addi	a5,a5,-844 # 1070 <malloc+0x244>
 3c4:	000a0363          	beqz	s4,3ca <dns+0x24c>
 3c8:	87d2                	mv	a5,s4
 3ca:	76fd                	lui	a3,0xfffff
 3cc:	7b068713          	addi	a4,a3,1968 # fffffffffffff7b0 <__global_pointer$+0xffffffffffffde4f>
 3d0:	9722                	add	a4,a4,s0
 3d2:	e31c                	sd	a5,0(a4)
  int record = 0;
 3d4:	7b868793          	addi	a5,a3,1976
 3d8:	97a2                	add	a5,a5,s0
 3da:	0007b023          	sd	zero,0(a5)
  for(int i = 0; i < ntohs(hdr->ancount); i++) {
 3de:	4a01                	li	s4,0
    if((int) qn[0] > 63) {  // compression?
 3e0:	03f00d93          	li	s11,63
    if(ntohs(d->type) == ARECORD && ntohs(d->len) == 4) {
 3e4:	4a85                	li	s5,1
 3e6:	4d11                	li	s10,4
      printf("DNS arecord for %s is ", qname ? qname : "" );
 3e8:	00001c97          	auipc	s9,0x1
 3ec:	c20c8c93          	addi	s9,s9,-992 # 1008 <malloc+0x1dc>
      if(ip[0] != 128 || ip[1] != 52 || ip[2] != 129 || ip[3] != 126) {
 3f0:	08000c13          	li	s8,128
 3f4:	03400b93          	li	s7,52
 3f8:	a8d9                	j	4ce <dns+0x350>
    fprintf(2, "dns: send() failed\n");
 3fa:	00001597          	auipc	a1,0x1
 3fe:	bae58593          	addi	a1,a1,-1106 # fa8 <malloc+0x17c>
 402:	4509                	li	a0,2
 404:	00001097          	auipc	ra,0x1
 408:	93c080e7          	jalr	-1732(ra) # d40 <fprintf>
    exit(1);
 40c:	4505                	li	a0,1
 40e:	00000097          	auipc	ra,0x0
 412:	5d8080e7          	jalr	1496(ra) # 9e6 <exit>
    fprintf(2, "dns: recv() failed\n");
 416:	00001597          	auipc	a1,0x1
 41a:	baa58593          	addi	a1,a1,-1110 # fc0 <malloc+0x194>
 41e:	4509                	li	a0,2
 420:	00001097          	auipc	ra,0x1
 424:	920080e7          	jalr	-1760(ra) # d40 <fprintf>
    exit(1);
 428:	4505                	li	a0,1
 42a:	00000097          	auipc	ra,0x0
 42e:	5bc080e7          	jalr	1468(ra) # 9e6 <exit>
    exit(1);
 432:	4505                	li	a0,1
 434:	00000097          	auipc	ra,0x0
 438:	5b2080e7          	jalr	1458(ra) # 9e6 <exit>
 43c:	0087d59b          	srliw	a1,a5,0x8
 440:	0087979b          	slliw	a5,a5,0x8
 444:	8ddd                	or	a1,a1,a5
    printf("DNS wrong id: %d\n", ntohs(hdr->id));
 446:	15c2                	slli	a1,a1,0x30
 448:	91c1                	srli	a1,a1,0x30
 44a:	00001517          	auipc	a0,0x1
 44e:	b8e50513          	addi	a0,a0,-1138 # fd8 <malloc+0x1ac>
 452:	00001097          	auipc	ra,0x1
 456:	91c080e7          	jalr	-1764(ra) # d6e <printf>
 45a:	bdc1                	j	32a <dns+0x1ac>
    printf("DNS rcode error: %x\n", hdr->rcode);
 45c:	77fd                	lui	a5,0xfffff
 45e:	7c378793          	addi	a5,a5,1987 # fffffffffffff7c3 <__global_pointer$+0xffffffffffffde62>
 462:	97a2                	add	a5,a5,s0
 464:	0007c583          	lbu	a1,0(a5)
 468:	89bd                	andi	a1,a1,15
 46a:	00001517          	auipc	a0,0x1
 46e:	b8650513          	addi	a0,a0,-1146 # ff0 <malloc+0x1c4>
 472:	00001097          	auipc	ra,0x1
 476:	8fc080e7          	jalr	-1796(ra) # d6e <printf>
    exit(1);
 47a:	4505                	li	a0,1
 47c:	00000097          	auipc	ra,0x0
 480:	56a080e7          	jalr	1386(ra) # 9e6 <exit>
      decode_qname(qn);
 484:	855a                	mv	a0,s6
 486:	00000097          	auipc	ra,0x0
 48a:	b7a080e7          	jalr	-1158(ra) # 0 <decode_qname>
      len += strlen(qn)+1;
 48e:	855a                	mv	a0,s6
 490:	00000097          	auipc	ra,0x0
 494:	328080e7          	jalr	808(ra) # 7b8 <strlen>
 498:	2485                	addiw	s1,s1,1
 49a:	9ca9                	addw	s1,s1,a0
 49c:	a0a1                	j	4e4 <dns+0x366>
      len += 4;
 49e:	00eb049b          	addiw	s1,s6,14
      record = 1;
 4a2:	77fd                	lui	a5,0xfffff
 4a4:	7b878793          	addi	a5,a5,1976 # fffffffffffff7b8 <__global_pointer$+0xffffffffffffde57>
 4a8:	97a2                	add	a5,a5,s0
 4aa:	0157b023          	sd	s5,0(a5)
  for(int i = 0; i < ntohs(hdr->ancount); i++) {
 4ae:	2a05                	addiw	s4,s4,1
 4b0:	77fd                	lui	a5,0xfffff
 4b2:	7c678793          	addi	a5,a5,1990 # fffffffffffff7c6 <__global_pointer$+0xffffffffffffde65>
 4b6:	97a2                	add	a5,a5,s0
 4b8:	0007d783          	lhu	a5,0(a5)
 4bc:	0087d71b          	srliw	a4,a5,0x8
 4c0:	0087979b          	slliw	a5,a5,0x8
 4c4:	8fd9                	or	a5,a5,a4
 4c6:	17c2                	slli	a5,a5,0x30
 4c8:	93c1                	srli	a5,a5,0x30
 4ca:	0efa5263          	bge	s4,a5,5ae <dns+0x430>
    char *qn = (char *) (ibuf+len);
 4ce:	77fd                	lui	a5,0xfffff
 4d0:	7c078793          	addi	a5,a5,1984 # fffffffffffff7c0 <__global_pointer$+0xffffffffffffde5f>
 4d4:	97a2                	add	a5,a5,s0
 4d6:	00978b33          	add	s6,a5,s1
    if((int) qn[0] > 63) {  // compression?
 4da:	000b4783          	lbu	a5,0(s6)
 4de:	fafdf3e3          	bgeu	s11,a5,484 <dns+0x306>
      len += 2;
 4e2:	2489                	addiw	s1,s1,2
    struct dns_data *d = (struct dns_data *) (ibuf+len);
 4e4:	77fd                	lui	a5,0xfffff
 4e6:	7c078793          	addi	a5,a5,1984 # fffffffffffff7c0 <__global_pointer$+0xffffffffffffde5f>
 4ea:	97a2                	add	a5,a5,s0
 4ec:	009786b3          	add	a3,a5,s1
    len += sizeof(struct dns_data);
 4f0:	00048b1b          	sext.w	s6,s1
 4f4:	24a9                	addiw	s1,s1,10
    if(ntohs(d->type) == ARECORD && ntohs(d->len) == 4) {
 4f6:	0006c783          	lbu	a5,0(a3)
 4fa:	0016c703          	lbu	a4,1(a3)
 4fe:	0722                	slli	a4,a4,0x8
 500:	8fd9                	or	a5,a5,a4
 502:	0087979b          	slliw	a5,a5,0x8
 506:	8321                	srli	a4,a4,0x8
 508:	8fd9                	or	a5,a5,a4
 50a:	17c2                	slli	a5,a5,0x30
 50c:	93c1                	srli	a5,a5,0x30
 50e:	fb5790e3          	bne	a5,s5,4ae <dns+0x330>
 512:	0086c783          	lbu	a5,8(a3)
 516:	0096c703          	lbu	a4,9(a3)
 51a:	0722                	slli	a4,a4,0x8
 51c:	8fd9                	or	a5,a5,a4
 51e:	0087979b          	slliw	a5,a5,0x8
 522:	8321                	srli	a4,a4,0x8
 524:	8fd9                	or	a5,a5,a4
 526:	17c2                	slli	a5,a5,0x30
 528:	93c1                	srli	a5,a5,0x30
 52a:	f9a792e3          	bne	a5,s10,4ae <dns+0x330>
      printf("DNS arecord for %s is ", qname ? qname : "" );
 52e:	77fd                	lui	a5,0xfffff
 530:	7b078793          	addi	a5,a5,1968 # fffffffffffff7b0 <__global_pointer$+0xffffffffffffde4f>
 534:	97a2                	add	a5,a5,s0
 536:	638c                	ld	a1,0(a5)
 538:	8566                	mv	a0,s9
 53a:	00001097          	auipc	ra,0x1
 53e:	834080e7          	jalr	-1996(ra) # d6e <printf>
      uint8 *ip = (ibuf+len);
 542:	77fd                	lui	a5,0xfffff
 544:	7c078793          	addi	a5,a5,1984 # fffffffffffff7c0 <__global_pointer$+0xffffffffffffde5f>
 548:	97a2                	add	a5,a5,s0
 54a:	94be                	add	s1,s1,a5
      printf("%d.%d.%d.%d\n", ip[0], ip[1], ip[2], ip[3]);
 54c:	0034c703          	lbu	a4,3(s1)
 550:	0024c683          	lbu	a3,2(s1)
 554:	0014c603          	lbu	a2,1(s1)
 558:	0004c583          	lbu	a1,0(s1)
 55c:	00001517          	auipc	a0,0x1
 560:	ac450513          	addi	a0,a0,-1340 # 1020 <malloc+0x1f4>
 564:	00001097          	auipc	ra,0x1
 568:	80a080e7          	jalr	-2038(ra) # d6e <printf>
      if(ip[0] != 128 || ip[1] != 52 || ip[2] != 129 || ip[3] != 126) {
 56c:	0004c783          	lbu	a5,0(s1)
 570:	03879263          	bne	a5,s8,594 <dns+0x416>
 574:	0014c783          	lbu	a5,1(s1)
 578:	01779e63          	bne	a5,s7,594 <dns+0x416>
 57c:	0024c703          	lbu	a4,2(s1)
 580:	08100793          	li	a5,129
 584:	00f71863          	bne	a4,a5,594 <dns+0x416>
 588:	0034c703          	lbu	a4,3(s1)
 58c:	07e00793          	li	a5,126
 590:	f0f707e3          	beq	a4,a5,49e <dns+0x320>
        printf("wrong ip address");
 594:	00001517          	auipc	a0,0x1
 598:	a9c50513          	addi	a0,a0,-1380 # 1030 <malloc+0x204>
 59c:	00000097          	auipc	ra,0x0
 5a0:	7d2080e7          	jalr	2002(ra) # d6e <printf>
        exit(1);
 5a4:	4505                	li	a0,1
 5a6:	00000097          	auipc	ra,0x0
 5aa:	440080e7          	jalr	1088(ra) # 9e6 <exit>
  if(len != cc) {
 5ae:	04999d63          	bne	s3,s1,608 <dns+0x48a>
  if(!record) {
 5b2:	77fd                	lui	a5,0xfffff
 5b4:	7b878793          	addi	a5,a5,1976 # fffffffffffff7b8 <__global_pointer$+0xffffffffffffde57>
 5b8:	97a2                	add	a5,a5,s0
 5ba:	639c                	ld	a5,0(a5)
 5bc:	c79d                	beqz	a5,5ea <dns+0x46c>
  }
  dns_rep(ibuf, cc);

  close(fd);
 5be:	854a                	mv	a0,s2
 5c0:	00000097          	auipc	ra,0x0
 5c4:	44e080e7          	jalr	1102(ra) # a0e <close>
}  
 5c8:	7d010113          	addi	sp,sp,2000
 5cc:	70e6                	ld	ra,120(sp)
 5ce:	7446                	ld	s0,112(sp)
 5d0:	74a6                	ld	s1,104(sp)
 5d2:	7906                	ld	s2,96(sp)
 5d4:	69e6                	ld	s3,88(sp)
 5d6:	6a46                	ld	s4,80(sp)
 5d8:	6aa6                	ld	s5,72(sp)
 5da:	6b06                	ld	s6,64(sp)
 5dc:	7be2                	ld	s7,56(sp)
 5de:	7c42                	ld	s8,48(sp)
 5e0:	7ca2                	ld	s9,40(sp)
 5e2:	7d02                	ld	s10,32(sp)
 5e4:	6de2                	ld	s11,24(sp)
 5e6:	6109                	addi	sp,sp,128
 5e8:	8082                	ret
    printf("Didn't receive an arecord\n");
 5ea:	00001517          	auipc	a0,0x1
 5ee:	a8e50513          	addi	a0,a0,-1394 # 1078 <malloc+0x24c>
 5f2:	00000097          	auipc	ra,0x0
 5f6:	77c080e7          	jalr	1916(ra) # d6e <printf>
    exit(1);
 5fa:	4505                	li	a0,1
 5fc:	00000097          	auipc	ra,0x0
 600:	3ea080e7          	jalr	1002(ra) # 9e6 <exit>
  if(len != cc) {
 604:	fe9983e3          	beq	s3,s1,5ea <dns+0x46c>
    printf("Processed %d data bytes but received %d\n", len, cc);
 608:	864e                	mv	a2,s3
 60a:	85a6                	mv	a1,s1
 60c:	00001517          	auipc	a0,0x1
 610:	a3c50513          	addi	a0,a0,-1476 # 1048 <malloc+0x21c>
 614:	00000097          	auipc	ra,0x0
 618:	75a080e7          	jalr	1882(ra) # d6e <printf>
    exit(1);
 61c:	4505                	li	a0,1
 61e:	00000097          	auipc	ra,0x0
 622:	3c8080e7          	jalr	968(ra) # 9e6 <exit>

0000000000000626 <main>:

int
main(int argc, char *argv[])
{
 626:	7179                	addi	sp,sp,-48
 628:	f406                	sd	ra,40(sp)
 62a:	f022                	sd	s0,32(sp)
 62c:	ec26                	sd	s1,24(sp)
 62e:	e84a                	sd	s2,16(sp)
 630:	1800                	addi	s0,sp,48
  int i, ret;
  uint16 dport = NET_TESTS_PORT;

  printf("nettests running on port %d\n", dport);
 632:	6499                	lui	s1,0x6
 634:	40048593          	addi	a1,s1,1024 # 6400 <__global_pointer$+0x4a9f>
 638:	00001517          	auipc	a0,0x1
 63c:	a6050513          	addi	a0,a0,-1440 # 1098 <malloc+0x26c>
 640:	00000097          	auipc	ra,0x0
 644:	72e080e7          	jalr	1838(ra) # d6e <printf>

  printf("testing one ping: ");
 648:	00001517          	auipc	a0,0x1
 64c:	a7050513          	addi	a0,a0,-1424 # 10b8 <malloc+0x28c>
 650:	00000097          	auipc	ra,0x0
 654:	71e080e7          	jalr	1822(ra) # d6e <printf>
  ping(2000, dport, 2);
 658:	4609                	li	a2,2
 65a:	40048593          	addi	a1,s1,1024
 65e:	7d000513          	li	a0,2000
 662:	00000097          	auipc	ra,0x0
 666:	9fe080e7          	jalr	-1538(ra) # 60 <ping>
  printf("OK\n");
 66a:	00001517          	auipc	a0,0x1
 66e:	a6650513          	addi	a0,a0,-1434 # 10d0 <malloc+0x2a4>
 672:	00000097          	auipc	ra,0x0
 676:	6fc080e7          	jalr	1788(ra) # d6e <printf>

  printf("testing single-process pings: ");
 67a:	00001517          	auipc	a0,0x1
 67e:	a5e50513          	addi	a0,a0,-1442 # 10d8 <malloc+0x2ac>
 682:	00000097          	auipc	ra,0x0
 686:	6ec080e7          	jalr	1772(ra) # d6e <printf>
 68a:	06400493          	li	s1,100
  for (i = 0; i < 100; i++)
    ping(2000, dport, 1);
 68e:	6919                	lui	s2,0x6
 690:	40090913          	addi	s2,s2,1024 # 6400 <__global_pointer$+0x4a9f>
 694:	4605                	li	a2,1
 696:	85ca                	mv	a1,s2
 698:	7d000513          	li	a0,2000
 69c:	00000097          	auipc	ra,0x0
 6a0:	9c4080e7          	jalr	-1596(ra) # 60 <ping>
  for (i = 0; i < 100; i++)
 6a4:	34fd                	addiw	s1,s1,-1
 6a6:	f4fd                	bnez	s1,694 <main+0x6e>
  printf("OK\n");
 6a8:	00001517          	auipc	a0,0x1
 6ac:	a2850513          	addi	a0,a0,-1496 # 10d0 <malloc+0x2a4>
 6b0:	00000097          	auipc	ra,0x0
 6b4:	6be080e7          	jalr	1726(ra) # d6e <printf>

  printf("testing multi-process pings: ");
 6b8:	00001517          	auipc	a0,0x1
 6bc:	a4050513          	addi	a0,a0,-1472 # 10f8 <malloc+0x2cc>
 6c0:	00000097          	auipc	ra,0x0
 6c4:	6ae080e7          	jalr	1710(ra) # d6e <printf>
  for (i = 0; i < 10; i++){
 6c8:	4929                	li	s2,10
    int pid = fork();
 6ca:	00000097          	auipc	ra,0x0
 6ce:	314080e7          	jalr	788(ra) # 9de <fork>
    if (pid == 0){
 6d2:	c92d                	beqz	a0,744 <main+0x11e>
  for (i = 0; i < 10; i++){
 6d4:	2485                	addiw	s1,s1,1
 6d6:	ff249ae3          	bne	s1,s2,6ca <main+0xa4>
 6da:	44a9                	li	s1,10
      ping(2000 + i + 1, dport, 1);
      exit(0);
    }
  }
  for (i = 0; i < 10; i++){
    wait(&ret);
 6dc:	fdc40513          	addi	a0,s0,-36
 6e0:	00000097          	auipc	ra,0x0
 6e4:	30e080e7          	jalr	782(ra) # 9ee <wait>
    if (ret != 0)
 6e8:	fdc42783          	lw	a5,-36(s0)
 6ec:	efad                	bnez	a5,766 <main+0x140>
  for (i = 0; i < 10; i++){
 6ee:	34fd                	addiw	s1,s1,-1
 6f0:	f4f5                	bnez	s1,6dc <main+0xb6>
      exit(1);
  }
  printf("OK\n");
 6f2:	00001517          	auipc	a0,0x1
 6f6:	9de50513          	addi	a0,a0,-1570 # 10d0 <malloc+0x2a4>
 6fa:	00000097          	auipc	ra,0x0
 6fe:	674080e7          	jalr	1652(ra) # d6e <printf>
  
  printf("testing DNS\n");
 702:	00001517          	auipc	a0,0x1
 706:	a1650513          	addi	a0,a0,-1514 # 1118 <malloc+0x2ec>
 70a:	00000097          	auipc	ra,0x0
 70e:	664080e7          	jalr	1636(ra) # d6e <printf>
  dns();
 712:	00000097          	auipc	ra,0x0
 716:	a6c080e7          	jalr	-1428(ra) # 17e <dns>
  printf("DNS OK\n");
 71a:	00001517          	auipc	a0,0x1
 71e:	a0e50513          	addi	a0,a0,-1522 # 1128 <malloc+0x2fc>
 722:	00000097          	auipc	ra,0x0
 726:	64c080e7          	jalr	1612(ra) # d6e <printf>
  
  printf("all tests passed.\n");
 72a:	00001517          	auipc	a0,0x1
 72e:	a0650513          	addi	a0,a0,-1530 # 1130 <malloc+0x304>
 732:	00000097          	auipc	ra,0x0
 736:	63c080e7          	jalr	1596(ra) # d6e <printf>
  exit(0);
 73a:	4501                	li	a0,0
 73c:	00000097          	auipc	ra,0x0
 740:	2aa080e7          	jalr	682(ra) # 9e6 <exit>
      ping(2000 + i + 1, dport, 1);
 744:	7d14851b          	addiw	a0,s1,2001
 748:	4605                	li	a2,1
 74a:	6599                	lui	a1,0x6
 74c:	40058593          	addi	a1,a1,1024 # 6400 <__global_pointer$+0x4a9f>
 750:	1542                	slli	a0,a0,0x30
 752:	9141                	srli	a0,a0,0x30
 754:	00000097          	auipc	ra,0x0
 758:	90c080e7          	jalr	-1780(ra) # 60 <ping>
      exit(0);
 75c:	4501                	li	a0,0
 75e:	00000097          	auipc	ra,0x0
 762:	288080e7          	jalr	648(ra) # 9e6 <exit>
      exit(1);
 766:	4505                	li	a0,1
 768:	00000097          	auipc	ra,0x0
 76c:	27e080e7          	jalr	638(ra) # 9e6 <exit>

0000000000000770 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 770:	1141                	addi	sp,sp,-16
 772:	e422                	sd	s0,8(sp)
 774:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 776:	87aa                	mv	a5,a0
 778:	0585                	addi	a1,a1,1
 77a:	0785                	addi	a5,a5,1
 77c:	fff5c703          	lbu	a4,-1(a1)
 780:	fee78fa3          	sb	a4,-1(a5)
 784:	fb75                	bnez	a4,778 <strcpy+0x8>
    ;
  return os;
}
 786:	6422                	ld	s0,8(sp)
 788:	0141                	addi	sp,sp,16
 78a:	8082                	ret

000000000000078c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 78c:	1141                	addi	sp,sp,-16
 78e:	e422                	sd	s0,8(sp)
 790:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 792:	00054783          	lbu	a5,0(a0)
 796:	cb91                	beqz	a5,7aa <strcmp+0x1e>
 798:	0005c703          	lbu	a4,0(a1)
 79c:	00f71763          	bne	a4,a5,7aa <strcmp+0x1e>
    p++, q++;
 7a0:	0505                	addi	a0,a0,1
 7a2:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 7a4:	00054783          	lbu	a5,0(a0)
 7a8:	fbe5                	bnez	a5,798 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 7aa:	0005c503          	lbu	a0,0(a1)
}
 7ae:	40a7853b          	subw	a0,a5,a0
 7b2:	6422                	ld	s0,8(sp)
 7b4:	0141                	addi	sp,sp,16
 7b6:	8082                	ret

00000000000007b8 <strlen>:

uint
strlen(const char *s)
{
 7b8:	1141                	addi	sp,sp,-16
 7ba:	e422                	sd	s0,8(sp)
 7bc:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 7be:	00054783          	lbu	a5,0(a0)
 7c2:	cf91                	beqz	a5,7de <strlen+0x26>
 7c4:	0505                	addi	a0,a0,1
 7c6:	87aa                	mv	a5,a0
 7c8:	4685                	li	a3,1
 7ca:	9e89                	subw	a3,a3,a0
 7cc:	00f6853b          	addw	a0,a3,a5
 7d0:	0785                	addi	a5,a5,1
 7d2:	fff7c703          	lbu	a4,-1(a5)
 7d6:	fb7d                	bnez	a4,7cc <strlen+0x14>
    ;
  return n;
}
 7d8:	6422                	ld	s0,8(sp)
 7da:	0141                	addi	sp,sp,16
 7dc:	8082                	ret
  for(n = 0; s[n]; n++)
 7de:	4501                	li	a0,0
 7e0:	bfe5                	j	7d8 <strlen+0x20>

00000000000007e2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 7e2:	1141                	addi	sp,sp,-16
 7e4:	e422                	sd	s0,8(sp)
 7e6:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 7e8:	ce09                	beqz	a2,802 <memset+0x20>
 7ea:	87aa                	mv	a5,a0
 7ec:	fff6071b          	addiw	a4,a2,-1
 7f0:	1702                	slli	a4,a4,0x20
 7f2:	9301                	srli	a4,a4,0x20
 7f4:	0705                	addi	a4,a4,1
 7f6:	972a                	add	a4,a4,a0
    cdst[i] = c;
 7f8:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 7fc:	0785                	addi	a5,a5,1
 7fe:	fee79de3          	bne	a5,a4,7f8 <memset+0x16>
  }
  return dst;
}
 802:	6422                	ld	s0,8(sp)
 804:	0141                	addi	sp,sp,16
 806:	8082                	ret

0000000000000808 <strchr>:

char*
strchr(const char *s, char c)
{
 808:	1141                	addi	sp,sp,-16
 80a:	e422                	sd	s0,8(sp)
 80c:	0800                	addi	s0,sp,16
  for(; *s; s++)
 80e:	00054783          	lbu	a5,0(a0)
 812:	cb99                	beqz	a5,828 <strchr+0x20>
    if(*s == c)
 814:	00f58763          	beq	a1,a5,822 <strchr+0x1a>
  for(; *s; s++)
 818:	0505                	addi	a0,a0,1
 81a:	00054783          	lbu	a5,0(a0)
 81e:	fbfd                	bnez	a5,814 <strchr+0xc>
      return (char*)s;
  return 0;
 820:	4501                	li	a0,0
}
 822:	6422                	ld	s0,8(sp)
 824:	0141                	addi	sp,sp,16
 826:	8082                	ret
  return 0;
 828:	4501                	li	a0,0
 82a:	bfe5                	j	822 <strchr+0x1a>

000000000000082c <gets>:

char*
gets(char *buf, int max)
{
 82c:	711d                	addi	sp,sp,-96
 82e:	ec86                	sd	ra,88(sp)
 830:	e8a2                	sd	s0,80(sp)
 832:	e4a6                	sd	s1,72(sp)
 834:	e0ca                	sd	s2,64(sp)
 836:	fc4e                	sd	s3,56(sp)
 838:	f852                	sd	s4,48(sp)
 83a:	f456                	sd	s5,40(sp)
 83c:	f05a                	sd	s6,32(sp)
 83e:	ec5e                	sd	s7,24(sp)
 840:	1080                	addi	s0,sp,96
 842:	8baa                	mv	s7,a0
 844:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 846:	892a                	mv	s2,a0
 848:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 84a:	4aa9                	li	s5,10
 84c:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 84e:	89a6                	mv	s3,s1
 850:	2485                	addiw	s1,s1,1
 852:	0344d863          	bge	s1,s4,882 <gets+0x56>
    cc = read(0, &c, 1);
 856:	4605                	li	a2,1
 858:	faf40593          	addi	a1,s0,-81
 85c:	4501                	li	a0,0
 85e:	00000097          	auipc	ra,0x0
 862:	1a0080e7          	jalr	416(ra) # 9fe <read>
    if(cc < 1)
 866:	00a05e63          	blez	a0,882 <gets+0x56>
    buf[i++] = c;
 86a:	faf44783          	lbu	a5,-81(s0)
 86e:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 872:	01578763          	beq	a5,s5,880 <gets+0x54>
 876:	0905                	addi	s2,s2,1
 878:	fd679be3          	bne	a5,s6,84e <gets+0x22>
  for(i=0; i+1 < max; ){
 87c:	89a6                	mv	s3,s1
 87e:	a011                	j	882 <gets+0x56>
 880:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 882:	99de                	add	s3,s3,s7
 884:	00098023          	sb	zero,0(s3)
  return buf;
}
 888:	855e                	mv	a0,s7
 88a:	60e6                	ld	ra,88(sp)
 88c:	6446                	ld	s0,80(sp)
 88e:	64a6                	ld	s1,72(sp)
 890:	6906                	ld	s2,64(sp)
 892:	79e2                	ld	s3,56(sp)
 894:	7a42                	ld	s4,48(sp)
 896:	7aa2                	ld	s5,40(sp)
 898:	7b02                	ld	s6,32(sp)
 89a:	6be2                	ld	s7,24(sp)
 89c:	6125                	addi	sp,sp,96
 89e:	8082                	ret

00000000000008a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 8a0:	1101                	addi	sp,sp,-32
 8a2:	ec06                	sd	ra,24(sp)
 8a4:	e822                	sd	s0,16(sp)
 8a6:	e426                	sd	s1,8(sp)
 8a8:	e04a                	sd	s2,0(sp)
 8aa:	1000                	addi	s0,sp,32
 8ac:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 8ae:	4581                	li	a1,0
 8b0:	00000097          	auipc	ra,0x0
 8b4:	176080e7          	jalr	374(ra) # a26 <open>
  if(fd < 0)
 8b8:	02054563          	bltz	a0,8e2 <stat+0x42>
 8bc:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 8be:	85ca                	mv	a1,s2
 8c0:	00000097          	auipc	ra,0x0
 8c4:	17e080e7          	jalr	382(ra) # a3e <fstat>
 8c8:	892a                	mv	s2,a0
  close(fd);
 8ca:	8526                	mv	a0,s1
 8cc:	00000097          	auipc	ra,0x0
 8d0:	142080e7          	jalr	322(ra) # a0e <close>
  return r;
}
 8d4:	854a                	mv	a0,s2
 8d6:	60e2                	ld	ra,24(sp)
 8d8:	6442                	ld	s0,16(sp)
 8da:	64a2                	ld	s1,8(sp)
 8dc:	6902                	ld	s2,0(sp)
 8de:	6105                	addi	sp,sp,32
 8e0:	8082                	ret
    return -1;
 8e2:	597d                	li	s2,-1
 8e4:	bfc5                	j	8d4 <stat+0x34>

00000000000008e6 <atoi>:

int
atoi(const char *s)
{
 8e6:	1141                	addi	sp,sp,-16
 8e8:	e422                	sd	s0,8(sp)
 8ea:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 8ec:	00054603          	lbu	a2,0(a0)
 8f0:	fd06079b          	addiw	a5,a2,-48
 8f4:	0ff7f793          	andi	a5,a5,255
 8f8:	4725                	li	a4,9
 8fa:	02f76963          	bltu	a4,a5,92c <atoi+0x46>
 8fe:	86aa                	mv	a3,a0
  n = 0;
 900:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 902:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 904:	0685                	addi	a3,a3,1
 906:	0025179b          	slliw	a5,a0,0x2
 90a:	9fa9                	addw	a5,a5,a0
 90c:	0017979b          	slliw	a5,a5,0x1
 910:	9fb1                	addw	a5,a5,a2
 912:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 916:	0006c603          	lbu	a2,0(a3)
 91a:	fd06071b          	addiw	a4,a2,-48
 91e:	0ff77713          	andi	a4,a4,255
 922:	fee5f1e3          	bgeu	a1,a4,904 <atoi+0x1e>
  return n;
}
 926:	6422                	ld	s0,8(sp)
 928:	0141                	addi	sp,sp,16
 92a:	8082                	ret
  n = 0;
 92c:	4501                	li	a0,0
 92e:	bfe5                	j	926 <atoi+0x40>

0000000000000930 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 930:	1141                	addi	sp,sp,-16
 932:	e422                	sd	s0,8(sp)
 934:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 936:	02b57663          	bgeu	a0,a1,962 <memmove+0x32>
    while(n-- > 0)
 93a:	02c05163          	blez	a2,95c <memmove+0x2c>
 93e:	fff6079b          	addiw	a5,a2,-1
 942:	1782                	slli	a5,a5,0x20
 944:	9381                	srli	a5,a5,0x20
 946:	0785                	addi	a5,a5,1
 948:	97aa                	add	a5,a5,a0
  dst = vdst;
 94a:	872a                	mv	a4,a0
      *dst++ = *src++;
 94c:	0585                	addi	a1,a1,1
 94e:	0705                	addi	a4,a4,1
 950:	fff5c683          	lbu	a3,-1(a1)
 954:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 958:	fee79ae3          	bne	a5,a4,94c <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 95c:	6422                	ld	s0,8(sp)
 95e:	0141                	addi	sp,sp,16
 960:	8082                	ret
    dst += n;
 962:	00c50733          	add	a4,a0,a2
    src += n;
 966:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 968:	fec05ae3          	blez	a2,95c <memmove+0x2c>
 96c:	fff6079b          	addiw	a5,a2,-1
 970:	1782                	slli	a5,a5,0x20
 972:	9381                	srli	a5,a5,0x20
 974:	fff7c793          	not	a5,a5
 978:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 97a:	15fd                	addi	a1,a1,-1
 97c:	177d                	addi	a4,a4,-1
 97e:	0005c683          	lbu	a3,0(a1)
 982:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 986:	fee79ae3          	bne	a5,a4,97a <memmove+0x4a>
 98a:	bfc9                	j	95c <memmove+0x2c>

000000000000098c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 98c:	1141                	addi	sp,sp,-16
 98e:	e422                	sd	s0,8(sp)
 990:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 992:	ca05                	beqz	a2,9c2 <memcmp+0x36>
 994:	fff6069b          	addiw	a3,a2,-1
 998:	1682                	slli	a3,a3,0x20
 99a:	9281                	srli	a3,a3,0x20
 99c:	0685                	addi	a3,a3,1
 99e:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 9a0:	00054783          	lbu	a5,0(a0)
 9a4:	0005c703          	lbu	a4,0(a1)
 9a8:	00e79863          	bne	a5,a4,9b8 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 9ac:	0505                	addi	a0,a0,1
    p2++;
 9ae:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 9b0:	fed518e3          	bne	a0,a3,9a0 <memcmp+0x14>
  }
  return 0;
 9b4:	4501                	li	a0,0
 9b6:	a019                	j	9bc <memcmp+0x30>
      return *p1 - *p2;
 9b8:	40e7853b          	subw	a0,a5,a4
}
 9bc:	6422                	ld	s0,8(sp)
 9be:	0141                	addi	sp,sp,16
 9c0:	8082                	ret
  return 0;
 9c2:	4501                	li	a0,0
 9c4:	bfe5                	j	9bc <memcmp+0x30>

00000000000009c6 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 9c6:	1141                	addi	sp,sp,-16
 9c8:	e406                	sd	ra,8(sp)
 9ca:	e022                	sd	s0,0(sp)
 9cc:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 9ce:	00000097          	auipc	ra,0x0
 9d2:	f62080e7          	jalr	-158(ra) # 930 <memmove>
}
 9d6:	60a2                	ld	ra,8(sp)
 9d8:	6402                	ld	s0,0(sp)
 9da:	0141                	addi	sp,sp,16
 9dc:	8082                	ret

00000000000009de <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 9de:	4885                	li	a7,1
 ecall
 9e0:	00000073          	ecall
 ret
 9e4:	8082                	ret

00000000000009e6 <exit>:
.global exit
exit:
 li a7, SYS_exit
 9e6:	4889                	li	a7,2
 ecall
 9e8:	00000073          	ecall
 ret
 9ec:	8082                	ret

00000000000009ee <wait>:
.global wait
wait:
 li a7, SYS_wait
 9ee:	488d                	li	a7,3
 ecall
 9f0:	00000073          	ecall
 ret
 9f4:	8082                	ret

00000000000009f6 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 9f6:	4891                	li	a7,4
 ecall
 9f8:	00000073          	ecall
 ret
 9fc:	8082                	ret

00000000000009fe <read>:
.global read
read:
 li a7, SYS_read
 9fe:	4895                	li	a7,5
 ecall
 a00:	00000073          	ecall
 ret
 a04:	8082                	ret

0000000000000a06 <write>:
.global write
write:
 li a7, SYS_write
 a06:	48c1                	li	a7,16
 ecall
 a08:	00000073          	ecall
 ret
 a0c:	8082                	ret

0000000000000a0e <close>:
.global close
close:
 li a7, SYS_close
 a0e:	48d5                	li	a7,21
 ecall
 a10:	00000073          	ecall
 ret
 a14:	8082                	ret

0000000000000a16 <kill>:
.global kill
kill:
 li a7, SYS_kill
 a16:	4899                	li	a7,6
 ecall
 a18:	00000073          	ecall
 ret
 a1c:	8082                	ret

0000000000000a1e <exec>:
.global exec
exec:
 li a7, SYS_exec
 a1e:	489d                	li	a7,7
 ecall
 a20:	00000073          	ecall
 ret
 a24:	8082                	ret

0000000000000a26 <open>:
.global open
open:
 li a7, SYS_open
 a26:	48bd                	li	a7,15
 ecall
 a28:	00000073          	ecall
 ret
 a2c:	8082                	ret

0000000000000a2e <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 a2e:	48c5                	li	a7,17
 ecall
 a30:	00000073          	ecall
 ret
 a34:	8082                	ret

0000000000000a36 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 a36:	48c9                	li	a7,18
 ecall
 a38:	00000073          	ecall
 ret
 a3c:	8082                	ret

0000000000000a3e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 a3e:	48a1                	li	a7,8
 ecall
 a40:	00000073          	ecall
 ret
 a44:	8082                	ret

0000000000000a46 <link>:
.global link
link:
 li a7, SYS_link
 a46:	48cd                	li	a7,19
 ecall
 a48:	00000073          	ecall
 ret
 a4c:	8082                	ret

0000000000000a4e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 a4e:	48d1                	li	a7,20
 ecall
 a50:	00000073          	ecall
 ret
 a54:	8082                	ret

0000000000000a56 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 a56:	48a5                	li	a7,9
 ecall
 a58:	00000073          	ecall
 ret
 a5c:	8082                	ret

0000000000000a5e <dup>:
.global dup
dup:
 li a7, SYS_dup
 a5e:	48a9                	li	a7,10
 ecall
 a60:	00000073          	ecall
 ret
 a64:	8082                	ret

0000000000000a66 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 a66:	48ad                	li	a7,11
 ecall
 a68:	00000073          	ecall
 ret
 a6c:	8082                	ret

0000000000000a6e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 a6e:	48b1                	li	a7,12
 ecall
 a70:	00000073          	ecall
 ret
 a74:	8082                	ret

0000000000000a76 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 a76:	48b5                	li	a7,13
 ecall
 a78:	00000073          	ecall
 ret
 a7c:	8082                	ret

0000000000000a7e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 a7e:	48b9                	li	a7,14
 ecall
 a80:	00000073          	ecall
 ret
 a84:	8082                	ret

0000000000000a86 <connect>:
.global connect
connect:
 li a7, SYS_connect
 a86:	48d9                	li	a7,22
 ecall
 a88:	00000073          	ecall
 ret
 a8c:	8082                	ret

0000000000000a8e <ntas>:
.global ntas
ntas:
 li a7, SYS_ntas
 a8e:	48dd                	li	a7,23
 ecall
 a90:	00000073          	ecall
 ret
 a94:	8082                	ret

0000000000000a96 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 a96:	1101                	addi	sp,sp,-32
 a98:	ec06                	sd	ra,24(sp)
 a9a:	e822                	sd	s0,16(sp)
 a9c:	1000                	addi	s0,sp,32
 a9e:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 aa2:	4605                	li	a2,1
 aa4:	fef40593          	addi	a1,s0,-17
 aa8:	00000097          	auipc	ra,0x0
 aac:	f5e080e7          	jalr	-162(ra) # a06 <write>
}
 ab0:	60e2                	ld	ra,24(sp)
 ab2:	6442                	ld	s0,16(sp)
 ab4:	6105                	addi	sp,sp,32
 ab6:	8082                	ret

0000000000000ab8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 ab8:	7139                	addi	sp,sp,-64
 aba:	fc06                	sd	ra,56(sp)
 abc:	f822                	sd	s0,48(sp)
 abe:	f426                	sd	s1,40(sp)
 ac0:	f04a                	sd	s2,32(sp)
 ac2:	ec4e                	sd	s3,24(sp)
 ac4:	0080                	addi	s0,sp,64
 ac6:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 ac8:	c299                	beqz	a3,ace <printint+0x16>
 aca:	0805c863          	bltz	a1,b5a <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 ace:	2581                	sext.w	a1,a1
  neg = 0;
 ad0:	4881                	li	a7,0
 ad2:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 ad6:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 ad8:	2601                	sext.w	a2,a2
 ada:	00000517          	auipc	a0,0x0
 ade:	67650513          	addi	a0,a0,1654 # 1150 <digits>
 ae2:	883a                	mv	a6,a4
 ae4:	2705                	addiw	a4,a4,1
 ae6:	02c5f7bb          	remuw	a5,a1,a2
 aea:	1782                	slli	a5,a5,0x20
 aec:	9381                	srli	a5,a5,0x20
 aee:	97aa                	add	a5,a5,a0
 af0:	0007c783          	lbu	a5,0(a5)
 af4:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 af8:	0005879b          	sext.w	a5,a1
 afc:	02c5d5bb          	divuw	a1,a1,a2
 b00:	0685                	addi	a3,a3,1
 b02:	fec7f0e3          	bgeu	a5,a2,ae2 <printint+0x2a>
  if(neg)
 b06:	00088b63          	beqz	a7,b1c <printint+0x64>
    buf[i++] = '-';
 b0a:	fd040793          	addi	a5,s0,-48
 b0e:	973e                	add	a4,a4,a5
 b10:	02d00793          	li	a5,45
 b14:	fef70823          	sb	a5,-16(a4)
 b18:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 b1c:	02e05863          	blez	a4,b4c <printint+0x94>
 b20:	fc040793          	addi	a5,s0,-64
 b24:	00e78933          	add	s2,a5,a4
 b28:	fff78993          	addi	s3,a5,-1
 b2c:	99ba                	add	s3,s3,a4
 b2e:	377d                	addiw	a4,a4,-1
 b30:	1702                	slli	a4,a4,0x20
 b32:	9301                	srli	a4,a4,0x20
 b34:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 b38:	fff94583          	lbu	a1,-1(s2)
 b3c:	8526                	mv	a0,s1
 b3e:	00000097          	auipc	ra,0x0
 b42:	f58080e7          	jalr	-168(ra) # a96 <putc>
  while(--i >= 0)
 b46:	197d                	addi	s2,s2,-1
 b48:	ff3918e3          	bne	s2,s3,b38 <printint+0x80>
}
 b4c:	70e2                	ld	ra,56(sp)
 b4e:	7442                	ld	s0,48(sp)
 b50:	74a2                	ld	s1,40(sp)
 b52:	7902                	ld	s2,32(sp)
 b54:	69e2                	ld	s3,24(sp)
 b56:	6121                	addi	sp,sp,64
 b58:	8082                	ret
    x = -xx;
 b5a:	40b005bb          	negw	a1,a1
    neg = 1;
 b5e:	4885                	li	a7,1
    x = -xx;
 b60:	bf8d                	j	ad2 <printint+0x1a>

0000000000000b62 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 b62:	7119                	addi	sp,sp,-128
 b64:	fc86                	sd	ra,120(sp)
 b66:	f8a2                	sd	s0,112(sp)
 b68:	f4a6                	sd	s1,104(sp)
 b6a:	f0ca                	sd	s2,96(sp)
 b6c:	ecce                	sd	s3,88(sp)
 b6e:	e8d2                	sd	s4,80(sp)
 b70:	e4d6                	sd	s5,72(sp)
 b72:	e0da                	sd	s6,64(sp)
 b74:	fc5e                	sd	s7,56(sp)
 b76:	f862                	sd	s8,48(sp)
 b78:	f466                	sd	s9,40(sp)
 b7a:	f06a                	sd	s10,32(sp)
 b7c:	ec6e                	sd	s11,24(sp)
 b7e:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 b80:	0005c903          	lbu	s2,0(a1)
 b84:	18090f63          	beqz	s2,d22 <vprintf+0x1c0>
 b88:	8aaa                	mv	s5,a0
 b8a:	8b32                	mv	s6,a2
 b8c:	00158493          	addi	s1,a1,1
  state = 0;
 b90:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 b92:	02500a13          	li	s4,37
      if(c == 'd'){
 b96:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 b9a:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 b9e:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 ba2:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 ba6:	00000b97          	auipc	s7,0x0
 baa:	5aab8b93          	addi	s7,s7,1450 # 1150 <digits>
 bae:	a839                	j	bcc <vprintf+0x6a>
        putc(fd, c);
 bb0:	85ca                	mv	a1,s2
 bb2:	8556                	mv	a0,s5
 bb4:	00000097          	auipc	ra,0x0
 bb8:	ee2080e7          	jalr	-286(ra) # a96 <putc>
 bbc:	a019                	j	bc2 <vprintf+0x60>
    } else if(state == '%'){
 bbe:	01498f63          	beq	s3,s4,bdc <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 bc2:	0485                	addi	s1,s1,1
 bc4:	fff4c903          	lbu	s2,-1(s1)
 bc8:	14090d63          	beqz	s2,d22 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 bcc:	0009079b          	sext.w	a5,s2
    if(state == 0){
 bd0:	fe0997e3          	bnez	s3,bbe <vprintf+0x5c>
      if(c == '%'){
 bd4:	fd479ee3          	bne	a5,s4,bb0 <vprintf+0x4e>
        state = '%';
 bd8:	89be                	mv	s3,a5
 bda:	b7e5                	j	bc2 <vprintf+0x60>
      if(c == 'd'){
 bdc:	05878063          	beq	a5,s8,c1c <vprintf+0xba>
      } else if(c == 'l') {
 be0:	05978c63          	beq	a5,s9,c38 <vprintf+0xd6>
      } else if(c == 'x') {
 be4:	07a78863          	beq	a5,s10,c54 <vprintf+0xf2>
      } else if(c == 'p') {
 be8:	09b78463          	beq	a5,s11,c70 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 bec:	07300713          	li	a4,115
 bf0:	0ce78663          	beq	a5,a4,cbc <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 bf4:	06300713          	li	a4,99
 bf8:	0ee78e63          	beq	a5,a4,cf4 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 bfc:	11478863          	beq	a5,s4,d0c <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 c00:	85d2                	mv	a1,s4
 c02:	8556                	mv	a0,s5
 c04:	00000097          	auipc	ra,0x0
 c08:	e92080e7          	jalr	-366(ra) # a96 <putc>
        putc(fd, c);
 c0c:	85ca                	mv	a1,s2
 c0e:	8556                	mv	a0,s5
 c10:	00000097          	auipc	ra,0x0
 c14:	e86080e7          	jalr	-378(ra) # a96 <putc>
      }
      state = 0;
 c18:	4981                	li	s3,0
 c1a:	b765                	j	bc2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 c1c:	008b0913          	addi	s2,s6,8
 c20:	4685                	li	a3,1
 c22:	4629                	li	a2,10
 c24:	000b2583          	lw	a1,0(s6)
 c28:	8556                	mv	a0,s5
 c2a:	00000097          	auipc	ra,0x0
 c2e:	e8e080e7          	jalr	-370(ra) # ab8 <printint>
 c32:	8b4a                	mv	s6,s2
      state = 0;
 c34:	4981                	li	s3,0
 c36:	b771                	j	bc2 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 c38:	008b0913          	addi	s2,s6,8
 c3c:	4681                	li	a3,0
 c3e:	4629                	li	a2,10
 c40:	000b2583          	lw	a1,0(s6)
 c44:	8556                	mv	a0,s5
 c46:	00000097          	auipc	ra,0x0
 c4a:	e72080e7          	jalr	-398(ra) # ab8 <printint>
 c4e:	8b4a                	mv	s6,s2
      state = 0;
 c50:	4981                	li	s3,0
 c52:	bf85                	j	bc2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 c54:	008b0913          	addi	s2,s6,8
 c58:	4681                	li	a3,0
 c5a:	4641                	li	a2,16
 c5c:	000b2583          	lw	a1,0(s6)
 c60:	8556                	mv	a0,s5
 c62:	00000097          	auipc	ra,0x0
 c66:	e56080e7          	jalr	-426(ra) # ab8 <printint>
 c6a:	8b4a                	mv	s6,s2
      state = 0;
 c6c:	4981                	li	s3,0
 c6e:	bf91                	j	bc2 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 c70:	008b0793          	addi	a5,s6,8
 c74:	f8f43423          	sd	a5,-120(s0)
 c78:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 c7c:	03000593          	li	a1,48
 c80:	8556                	mv	a0,s5
 c82:	00000097          	auipc	ra,0x0
 c86:	e14080e7          	jalr	-492(ra) # a96 <putc>
  putc(fd, 'x');
 c8a:	85ea                	mv	a1,s10
 c8c:	8556                	mv	a0,s5
 c8e:	00000097          	auipc	ra,0x0
 c92:	e08080e7          	jalr	-504(ra) # a96 <putc>
 c96:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 c98:	03c9d793          	srli	a5,s3,0x3c
 c9c:	97de                	add	a5,a5,s7
 c9e:	0007c583          	lbu	a1,0(a5)
 ca2:	8556                	mv	a0,s5
 ca4:	00000097          	auipc	ra,0x0
 ca8:	df2080e7          	jalr	-526(ra) # a96 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 cac:	0992                	slli	s3,s3,0x4
 cae:	397d                	addiw	s2,s2,-1
 cb0:	fe0914e3          	bnez	s2,c98 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 cb4:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 cb8:	4981                	li	s3,0
 cba:	b721                	j	bc2 <vprintf+0x60>
        s = va_arg(ap, char*);
 cbc:	008b0993          	addi	s3,s6,8
 cc0:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 cc4:	02090163          	beqz	s2,ce6 <vprintf+0x184>
        while(*s != 0){
 cc8:	00094583          	lbu	a1,0(s2)
 ccc:	c9a1                	beqz	a1,d1c <vprintf+0x1ba>
          putc(fd, *s);
 cce:	8556                	mv	a0,s5
 cd0:	00000097          	auipc	ra,0x0
 cd4:	dc6080e7          	jalr	-570(ra) # a96 <putc>
          s++;
 cd8:	0905                	addi	s2,s2,1
        while(*s != 0){
 cda:	00094583          	lbu	a1,0(s2)
 cde:	f9e5                	bnez	a1,cce <vprintf+0x16c>
        s = va_arg(ap, char*);
 ce0:	8b4e                	mv	s6,s3
      state = 0;
 ce2:	4981                	li	s3,0
 ce4:	bdf9                	j	bc2 <vprintf+0x60>
          s = "(null)";
 ce6:	00000917          	auipc	s2,0x0
 cea:	46290913          	addi	s2,s2,1122 # 1148 <malloc+0x31c>
        while(*s != 0){
 cee:	02800593          	li	a1,40
 cf2:	bff1                	j	cce <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 cf4:	008b0913          	addi	s2,s6,8
 cf8:	000b4583          	lbu	a1,0(s6)
 cfc:	8556                	mv	a0,s5
 cfe:	00000097          	auipc	ra,0x0
 d02:	d98080e7          	jalr	-616(ra) # a96 <putc>
 d06:	8b4a                	mv	s6,s2
      state = 0;
 d08:	4981                	li	s3,0
 d0a:	bd65                	j	bc2 <vprintf+0x60>
        putc(fd, c);
 d0c:	85d2                	mv	a1,s4
 d0e:	8556                	mv	a0,s5
 d10:	00000097          	auipc	ra,0x0
 d14:	d86080e7          	jalr	-634(ra) # a96 <putc>
      state = 0;
 d18:	4981                	li	s3,0
 d1a:	b565                	j	bc2 <vprintf+0x60>
        s = va_arg(ap, char*);
 d1c:	8b4e                	mv	s6,s3
      state = 0;
 d1e:	4981                	li	s3,0
 d20:	b54d                	j	bc2 <vprintf+0x60>
    }
  }
}
 d22:	70e6                	ld	ra,120(sp)
 d24:	7446                	ld	s0,112(sp)
 d26:	74a6                	ld	s1,104(sp)
 d28:	7906                	ld	s2,96(sp)
 d2a:	69e6                	ld	s3,88(sp)
 d2c:	6a46                	ld	s4,80(sp)
 d2e:	6aa6                	ld	s5,72(sp)
 d30:	6b06                	ld	s6,64(sp)
 d32:	7be2                	ld	s7,56(sp)
 d34:	7c42                	ld	s8,48(sp)
 d36:	7ca2                	ld	s9,40(sp)
 d38:	7d02                	ld	s10,32(sp)
 d3a:	6de2                	ld	s11,24(sp)
 d3c:	6109                	addi	sp,sp,128
 d3e:	8082                	ret

0000000000000d40 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 d40:	715d                	addi	sp,sp,-80
 d42:	ec06                	sd	ra,24(sp)
 d44:	e822                	sd	s0,16(sp)
 d46:	1000                	addi	s0,sp,32
 d48:	e010                	sd	a2,0(s0)
 d4a:	e414                	sd	a3,8(s0)
 d4c:	e818                	sd	a4,16(s0)
 d4e:	ec1c                	sd	a5,24(s0)
 d50:	03043023          	sd	a6,32(s0)
 d54:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 d58:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 d5c:	8622                	mv	a2,s0
 d5e:	00000097          	auipc	ra,0x0
 d62:	e04080e7          	jalr	-508(ra) # b62 <vprintf>
}
 d66:	60e2                	ld	ra,24(sp)
 d68:	6442                	ld	s0,16(sp)
 d6a:	6161                	addi	sp,sp,80
 d6c:	8082                	ret

0000000000000d6e <printf>:

void
printf(const char *fmt, ...)
{
 d6e:	711d                	addi	sp,sp,-96
 d70:	ec06                	sd	ra,24(sp)
 d72:	e822                	sd	s0,16(sp)
 d74:	1000                	addi	s0,sp,32
 d76:	e40c                	sd	a1,8(s0)
 d78:	e810                	sd	a2,16(s0)
 d7a:	ec14                	sd	a3,24(s0)
 d7c:	f018                	sd	a4,32(s0)
 d7e:	f41c                	sd	a5,40(s0)
 d80:	03043823          	sd	a6,48(s0)
 d84:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 d88:	00840613          	addi	a2,s0,8
 d8c:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 d90:	85aa                	mv	a1,a0
 d92:	4505                	li	a0,1
 d94:	00000097          	auipc	ra,0x0
 d98:	dce080e7          	jalr	-562(ra) # b62 <vprintf>
}
 d9c:	60e2                	ld	ra,24(sp)
 d9e:	6442                	ld	s0,16(sp)
 da0:	6125                	addi	sp,sp,96
 da2:	8082                	ret

0000000000000da4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 da4:	1141                	addi	sp,sp,-16
 da6:	e422                	sd	s0,8(sp)
 da8:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 daa:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 dae:	00000797          	auipc	a5,0x0
 db2:	3ba7b783          	ld	a5,954(a5) # 1168 <freep>
 db6:	a805                	j	de6 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 db8:	4618                	lw	a4,8(a2)
 dba:	9db9                	addw	a1,a1,a4
 dbc:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 dc0:	6398                	ld	a4,0(a5)
 dc2:	6318                	ld	a4,0(a4)
 dc4:	fee53823          	sd	a4,-16(a0)
 dc8:	a091                	j	e0c <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 dca:	ff852703          	lw	a4,-8(a0)
 dce:	9e39                	addw	a2,a2,a4
 dd0:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 dd2:	ff053703          	ld	a4,-16(a0)
 dd6:	e398                	sd	a4,0(a5)
 dd8:	a099                	j	e1e <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 dda:	6398                	ld	a4,0(a5)
 ddc:	00e7e463          	bltu	a5,a4,de4 <free+0x40>
 de0:	00e6ea63          	bltu	a3,a4,df4 <free+0x50>
{
 de4:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 de6:	fed7fae3          	bgeu	a5,a3,dda <free+0x36>
 dea:	6398                	ld	a4,0(a5)
 dec:	00e6e463          	bltu	a3,a4,df4 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 df0:	fee7eae3          	bltu	a5,a4,de4 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 df4:	ff852583          	lw	a1,-8(a0)
 df8:	6390                	ld	a2,0(a5)
 dfa:	02059713          	slli	a4,a1,0x20
 dfe:	9301                	srli	a4,a4,0x20
 e00:	0712                	slli	a4,a4,0x4
 e02:	9736                	add	a4,a4,a3
 e04:	fae60ae3          	beq	a2,a4,db8 <free+0x14>
    bp->s.ptr = p->s.ptr;
 e08:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 e0c:	4790                	lw	a2,8(a5)
 e0e:	02061713          	slli	a4,a2,0x20
 e12:	9301                	srli	a4,a4,0x20
 e14:	0712                	slli	a4,a4,0x4
 e16:	973e                	add	a4,a4,a5
 e18:	fae689e3          	beq	a3,a4,dca <free+0x26>
  } else
    p->s.ptr = bp;
 e1c:	e394                	sd	a3,0(a5)
  freep = p;
 e1e:	00000717          	auipc	a4,0x0
 e22:	34f73523          	sd	a5,842(a4) # 1168 <freep>
}
 e26:	6422                	ld	s0,8(sp)
 e28:	0141                	addi	sp,sp,16
 e2a:	8082                	ret

0000000000000e2c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 e2c:	7139                	addi	sp,sp,-64
 e2e:	fc06                	sd	ra,56(sp)
 e30:	f822                	sd	s0,48(sp)
 e32:	f426                	sd	s1,40(sp)
 e34:	f04a                	sd	s2,32(sp)
 e36:	ec4e                	sd	s3,24(sp)
 e38:	e852                	sd	s4,16(sp)
 e3a:	e456                	sd	s5,8(sp)
 e3c:	e05a                	sd	s6,0(sp)
 e3e:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 e40:	02051493          	slli	s1,a0,0x20
 e44:	9081                	srli	s1,s1,0x20
 e46:	04bd                	addi	s1,s1,15
 e48:	8091                	srli	s1,s1,0x4
 e4a:	0014899b          	addiw	s3,s1,1
 e4e:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 e50:	00000517          	auipc	a0,0x0
 e54:	31853503          	ld	a0,792(a0) # 1168 <freep>
 e58:	c515                	beqz	a0,e84 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e5a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 e5c:	4798                	lw	a4,8(a5)
 e5e:	02977f63          	bgeu	a4,s1,e9c <malloc+0x70>
 e62:	8a4e                	mv	s4,s3
 e64:	0009871b          	sext.w	a4,s3
 e68:	6685                	lui	a3,0x1
 e6a:	00d77363          	bgeu	a4,a3,e70 <malloc+0x44>
 e6e:	6a05                	lui	s4,0x1
 e70:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 e74:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 e78:	00000917          	auipc	s2,0x0
 e7c:	2f090913          	addi	s2,s2,752 # 1168 <freep>
  if(p == (char*)-1)
 e80:	5afd                	li	s5,-1
 e82:	a88d                	j	ef4 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 e84:	00000797          	auipc	a5,0x0
 e88:	2ec78793          	addi	a5,a5,748 # 1170 <base>
 e8c:	00000717          	auipc	a4,0x0
 e90:	2cf73e23          	sd	a5,732(a4) # 1168 <freep>
 e94:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 e96:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 e9a:	b7e1                	j	e62 <malloc+0x36>
      if(p->s.size == nunits)
 e9c:	02e48b63          	beq	s1,a4,ed2 <malloc+0xa6>
        p->s.size -= nunits;
 ea0:	4137073b          	subw	a4,a4,s3
 ea4:	c798                	sw	a4,8(a5)
        p += p->s.size;
 ea6:	1702                	slli	a4,a4,0x20
 ea8:	9301                	srli	a4,a4,0x20
 eaa:	0712                	slli	a4,a4,0x4
 eac:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 eae:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 eb2:	00000717          	auipc	a4,0x0
 eb6:	2aa73b23          	sd	a0,694(a4) # 1168 <freep>
      return (void*)(p + 1);
 eba:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 ebe:	70e2                	ld	ra,56(sp)
 ec0:	7442                	ld	s0,48(sp)
 ec2:	74a2                	ld	s1,40(sp)
 ec4:	7902                	ld	s2,32(sp)
 ec6:	69e2                	ld	s3,24(sp)
 ec8:	6a42                	ld	s4,16(sp)
 eca:	6aa2                	ld	s5,8(sp)
 ecc:	6b02                	ld	s6,0(sp)
 ece:	6121                	addi	sp,sp,64
 ed0:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 ed2:	6398                	ld	a4,0(a5)
 ed4:	e118                	sd	a4,0(a0)
 ed6:	bff1                	j	eb2 <malloc+0x86>
  hp->s.size = nu;
 ed8:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 edc:	0541                	addi	a0,a0,16
 ede:	00000097          	auipc	ra,0x0
 ee2:	ec6080e7          	jalr	-314(ra) # da4 <free>
  return freep;
 ee6:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 eea:	d971                	beqz	a0,ebe <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 eec:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 eee:	4798                	lw	a4,8(a5)
 ef0:	fa9776e3          	bgeu	a4,s1,e9c <malloc+0x70>
    if(p == freep)
 ef4:	00093703          	ld	a4,0(s2)
 ef8:	853e                	mv	a0,a5
 efa:	fef719e3          	bne	a4,a5,eec <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 efe:	8552                	mv	a0,s4
 f00:	00000097          	auipc	ra,0x0
 f04:	b6e080e7          	jalr	-1170(ra) # a6e <sbrk>
  if(p == (char*)-1)
 f08:	fd5518e3          	bne	a0,s5,ed8 <malloc+0xac>
        return 0;
 f0c:	4501                	li	a0,0
 f0e:	bf45                	j	ebe <malloc+0x92>
