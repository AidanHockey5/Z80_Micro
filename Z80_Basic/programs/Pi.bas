10 PRINT CHR$(147)
20 n = 100
30 ln = int(10*n/4)
40 nd = 1
50 dim a(ln)
60 n9 = 0
70 pd = 0 :rem First predigit is a 0
80 :
90 for j = 1 to ln
100    a(j-1) = 2 :rem Start with 2s
110 next j
120 :
130 for j = 1 to n
140     q = 0
150     for i = ln to 1 step -1 :rem Work backwards
160         x = 10*a(i-1) + q*i
170         a(i-1) = x - (2*i-1)*int(x/(2*i-1)) :rem X - INT ( X / Y) * Y
180         q = int(x/(2*i - 1))
190     next i
200     a(0) = q-10*int(q/10)
210     q = int(q/10)
220     if q=9 then n9 = n9 + 1 : goto 450
240     if q<>10 then 350
250     rem q == 10
260        d = pd+1 : gosub 500
270        if n9 < 0 then 320
280           for k = 1 to n9
290              d = 0: gosub 500
300           next k
310        rem end if
320        pd = 0
330        n9 = 0
335        goto 450
340     rem q <> 10
350        d = pd: gosub 500
360        pd = q
370        if n9 = 0 then 450
380           for k = 1 to n9
390              d = 9 : gosub 500
400           next k
410           n9 = 0
450 next j
460 print mid$(str$(pd),2,1)
470 end
480 :
490 rem outputd
500 if nd=0 then print mid$(str$(d),2,1); : return
510 if d=0 then return
520 print mid$(str$(d),2,1);".";
530 nd = 0
550 return