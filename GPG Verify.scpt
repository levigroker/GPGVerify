FasdUAS 1.101.10   ��   ��    k             l      ��  ��   
�
�
GPG Verify
A manually activated Script to verify signed files with GPG (see GPG homepage
http://www.gnupg.org/ )
By Levi Brown <mailto:levigroker@gmail.com>
Version 1.0.4 April 24th, 2020

This script works in tandem with the 'gpg' command line binary (which should
already be installed and functional) to provide a simple user interface to the
validation of signed files with a detached signature.

The intention is for this script to be accessed from the Script Menu and acts on
the current selection in the Finder.  If only one file is selected the script
will attempt to locate the matching signed file or detached signature file based
on file name.  I suggest adding this script to the Finder Scripts Folder so it
is available from the Finder as needed.  For more information about the Script
Menu please visit: http://www.apple.com/applescript/scriptmenu/

* This script has been tested on Mac OS X 10.4.7 to 10.15.4 under US English and may
contain i18n issues which are not accounted for.

Please feel free to contact me with improvements and feedback.

Release History:
1.0   September 18th, 2006: Internal initial release.
1.0.1 September 8th, 2011: Release to GitHub.
1.0.2 September 27th, 2017: Minor compatibility fix for GPG 2.2.0.
1.0.3 September 3rd, 2019: Extract keyserver to property (and update). Remove obsolete keyserver-options
1.0.4 April 24th, 2020: Handle alias conversion error in Catalina.

Copyright (c) 2006-2020 Levi Brown.
This work is licensed under the Creative Commons Attribution 4.0 International
License. To view a copy of this license, visit
https://creativecommons.org/licenses/by/4.0/

1. DISCLAIMER OF WARRANTY.  ALL EXPRESS OR IMPLIED CONDITIONS, REPRESENTATIONS
AND WARRANTIES, INCLUDING ANY IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A
PARTICULAR PURPOSE OR NON-INFRINGEMENT ARE DISCLAIMED, EXCEPT TO THE EXTENT THAT
THESE DISCLAIMERS ARE HELD TO BE LEGALLY INVALID.

2. LIMITATION OF LIABILITY.  TO THE EXTENT NOT PROHIBITED BY LAW, IN NO EVENT
WILL THE AUTHOR OR THE AUTHOR'S LICENSORS BE LIABLE FOR ANY LOST REVENUE, PROFIT
OR DATA, OR FOR SPECIAL, INDIRECT, CONSEQUENTIAL, INCIDENTAL OR PUNITIVE
DAMAGES, HOWEVER CAUSED REGARDLESS OF THE THEORY OF LIABILITY, ARISING OUT OF OR
RELATED TO THE USE OF OR INABILITY TO USE SOFTWARE, EVEN IF THE AUTHOR HAS BEEN
ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.  In no event will the author's
liability to you, whether in contract, tort (including negligence), or
otherwise, exceed the amount paid by you for Software under this Agreement. The
foregoing limitations will apply even if the above stated warranty fails of its
essential purpose. Some states do not allow the exclusion of incidental or
consequential damages, so some of the terms above may not be applicable to you.
     � 	 	� 
 G P G   V e r i f y 
 A   m a n u a l l y   a c t i v a t e d   S c r i p t   t o   v e r i f y   s i g n e d   f i l e s   w i t h   G P G   ( s e e   G P G   h o m e p a g e 
 h t t p : / / w w w . g n u p g . o r g /   ) 
 B y   L e v i   B r o w n   < m a i l t o : l e v i g r o k e r @ g m a i l . c o m > 
 V e r s i o n   1 . 0 . 4   A p r i l   2 4 t h ,   2 0 2 0 
 
 T h i s   s c r i p t   w o r k s   i n   t a n d e m   w i t h   t h e   ' g p g '   c o m m a n d   l i n e   b i n a r y   ( w h i c h   s h o u l d 
 a l r e a d y   b e   i n s t a l l e d   a n d   f u n c t i o n a l )   t o   p r o v i d e   a   s i m p l e   u s e r   i n t e r f a c e   t o   t h e 
 v a l i d a t i o n   o f   s i g n e d   f i l e s   w i t h   a   d e t a c h e d   s i g n a t u r e . 
 
 T h e   i n t e n t i o n   i s   f o r   t h i s   s c r i p t   t o   b e   a c c e s s e d   f r o m   t h e   S c r i p t   M e n u   a n d   a c t s   o n 
 t h e   c u r r e n t   s e l e c t i o n   i n   t h e   F i n d e r .     I f   o n l y   o n e   f i l e   i s   s e l e c t e d   t h e   s c r i p t 
 w i l l   a t t e m p t   t o   l o c a t e   t h e   m a t c h i n g   s i g n e d   f i l e   o r   d e t a c h e d   s i g n a t u r e   f i l e   b a s e d 
 o n   f i l e   n a m e .     I   s u g g e s t   a d d i n g   t h i s   s c r i p t   t o   t h e   F i n d e r   S c r i p t s   F o l d e r   s o   i t 
 i s   a v a i l a b l e   f r o m   t h e   F i n d e r   a s   n e e d e d .     F o r   m o r e   i n f o r m a t i o n   a b o u t   t h e   S c r i p t 
 M e n u   p l e a s e   v i s i t :   h t t p : / / w w w . a p p l e . c o m / a p p l e s c r i p t / s c r i p t m e n u / 
 
 *   T h i s   s c r i p t   h a s   b e e n   t e s t e d   o n   M a c   O S   X   1 0 . 4 . 7   t o   1 0 . 1 5 . 4   u n d e r   U S   E n g l i s h   a n d   m a y 
 c o n t a i n   i 1 8 n   i s s u e s   w h i c h   a r e   n o t   a c c o u n t e d   f o r . 
 
 P l e a s e   f e e l   f r e e   t o   c o n t a c t   m e   w i t h   i m p r o v e m e n t s   a n d   f e e d b a c k . 
 
 R e l e a s e   H i s t o r y : 
 1 . 0       S e p t e m b e r   1 8 t h ,   2 0 0 6 :   I n t e r n a l   i n i t i a l   r e l e a s e . 
 1 . 0 . 1   S e p t e m b e r   8 t h ,   2 0 1 1 :   R e l e a s e   t o   G i t H u b . 
 1 . 0 . 2   S e p t e m b e r   2 7 t h ,   2 0 1 7 :   M i n o r   c o m p a t i b i l i t y   f i x   f o r   G P G   2 . 2 . 0 . 
 1 . 0 . 3   S e p t e m b e r   3 r d ,   2 0 1 9 :   E x t r a c t   k e y s e r v e r   t o   p r o p e r t y   ( a n d   u p d a t e ) .   R e m o v e   o b s o l e t e   k e y s e r v e r - o p t i o n s 
 1 . 0 . 4   A p r i l   2 4 t h ,   2 0 2 0 :   H a n d l e   a l i a s   c o n v e r s i o n   e r r o r   i n   C a t a l i n a . 
 
 C o p y r i g h t   ( c )   2 0 0 6 - 2 0 2 0   L e v i   B r o w n . 
 T h i s   w o r k   i s   l i c e n s e d   u n d e r   t h e   C r e a t i v e   C o m m o n s   A t t r i b u t i o n   4 . 0   I n t e r n a t i o n a l 
 L i c e n s e .   T o   v i e w   a   c o p y   o f   t h i s   l i c e n s e ,   v i s i t 
 h t t p s : / / c r e a t i v e c o m m o n s . o r g / l i c e n s e s / b y / 4 . 0 / 
 
 1 .   D I S C L A I M E R   O F   W A R R A N T Y .     A L L   E X P R E S S   O R   I M P L I E D   C O N D I T I O N S ,   R E P R E S E N T A T I O N S 
 A N D   W A R R A N T I E S ,   I N C L U D I N G   A N Y   I M P L I E D   W A R R A N T Y   O F   M E R C H A N T A B I L I T Y ,   F I T N E S S   F O R   A 
 P A R T I C U L A R   P U R P O S E   O R   N O N - I N F R I N G E M E N T   A R E   D I S C L A I M E D ,   E X C E P T   T O   T H E   E X T E N T   T H A T 
 T H E S E   D I S C L A I M E R S   A R E   H E L D   T O   B E   L E G A L L Y   I N V A L I D . 
 
 2 .   L I M I T A T I O N   O F   L I A B I L I T Y .     T O   T H E   E X T E N T   N O T   P R O H I B I T E D   B Y   L A W ,   I N   N O   E V E N T 
 W I L L   T H E   A U T H O R   O R   T H E   A U T H O R ' S   L I C E N S O R S   B E   L I A B L E   F O R   A N Y   L O S T   R E V E N U E ,   P R O F I T 
 O R   D A T A ,   O R   F O R   S P E C I A L ,   I N D I R E C T ,   C O N S E Q U E N T I A L ,   I N C I D E N T A L   O R   P U N I T I V E 
 D A M A G E S ,   H O W E V E R   C A U S E D   R E G A R D L E S S   O F   T H E   T H E O R Y   O F   L I A B I L I T Y ,   A R I S I N G   O U T   O F   O R 
 R E L A T E D   T O   T H E   U S E   O F   O R   I N A B I L I T Y   T O   U S E   S O F T W A R E ,   E V E N   I F   T H E   A U T H O R   H A S   B E E N 
 A D V I S E D   O F   T H E   P O S S I B I L I T Y   O F   S U C H   D A M A G E S .     I n   n o   e v e n t   w i l l   t h e   a u t h o r ' s 
 l i a b i l i t y   t o   y o u ,   w h e t h e r   i n   c o n t r a c t ,   t o r t   ( i n c l u d i n g   n e g l i g e n c e ) ,   o r 
 o t h e r w i s e ,   e x c e e d   t h e   a m o u n t   p a i d   b y   y o u   f o r   S o f t w a r e   u n d e r   t h i s   A g r e e m e n t .   T h e 
 f o r e g o i n g   l i m i t a t i o n s   w i l l   a p p l y   e v e n   i f   t h e   a b o v e   s t a t e d   w a r r a n t y   f a i l s   o f   i t s 
 e s s e n t i a l   p u r p o s e .   S o m e   s t a t e s   d o   n o t   a l l o w   t h e   e x c l u s i o n   o f   i n c i d e n t a l   o r 
 c o n s e q u e n t i a l   d a m a g e s ,   s o   s o m e   o f   t h e   t e r m s   a b o v e   m a y   n o t   b e   a p p l i c a b l e   t o   y o u . 
   
  
 l     ��������  ��  ��        j     �� �� 0 _sig_file_extensions    J            m        �    . a s c . t x t      m       �    . t x t      m       �    . a s c   ��  m       �    . s i g��         j    
�� !�� 0 
_keyserver   ! m    	 " " � # # . p o o l . s k s - k e y s e r v e r s . n e t    $ % $ l     ��������  ��  ��   %  & ' & i     ( ) ( I     ������
�� .aevtoappnull  �   � ****��  ��   ) O    k * + * k   j , ,  - . - r    	 / 0 / 1    ��
�� 
sele 0 o      ���� 0 _sel   .  1 2 1 r   
  3 4 3 n   
  5 6 5 m    ��
�� 
nmbr 6 n   
  7 8 7 2   ��
�� 
cobj 8 o   
 ���� 0 _sel   4 o      ���� 0 cnt   2  9 : 9 l   ��������  ��  ��   :  ;�� ; Z   j < = > ? < =    @ A @ o    ���� 0 cnt   A m    ����   = k    + B B  C D C I   ������
�� .sysobeepnull��� ��� long��  ��   D  E�� E I   +�� F G
�� .sysodlogaskr        TEXT F m     H H � I I � P l e a s e   s e l e c t   t h e   t a r g e t   f i l e   a n d / o r   t h e   c o r r e s p o n d i n g   s i g n a t u r e   f i l e . G �� J K
�� 
btns J J     # L L  M�� M m     ! N N � O O  C a n c e l��   K �� P Q
�� 
dflt P m   $ % R R � S S  C a n c e l Q �� T��
�� 
disp T m   & '����  ��  ��   >  U V U ?   . 1 W X W o   . /���� 0 cnt   X m   / 0����  V  Y�� Y k   4 K Z Z  [ \ [ I  4 9������
�� .sysobeepnull��� ��� long��  ��   \  ]�� ] I  : K�� ^ _
�� .sysodlogaskr        TEXT ^ m   : ; ` ` � a a � P l e a s e   s e l e c t   o n l y   t h e   t a r g e t   f i l e   a n d / o r   t h e   c o r r e s p o n d i n g   s i g n a t u r e   f i l e . _ �� b c
�� 
btns b J   < A d d  e�� e m   < ? f f � g g  C a n c e l��   c �� h i
�� 
dflt h m   B E j j � k k  C a n c e l i �� l��
�� 
disp l m   F G����  ��  ��  ��   ? k   Nj m m  n o n l  N N��������  ��  ��   o  p q p Z   N � r s�� t r =  N Q u v u o   N O���� 0 cnt   v m   O P����  s k   T � w w  x y x r   T \ z { z n   T X | } | 4   U X�� ~
�� 
cobj ~ m   V W����  } o   T U���� 0 _sel   { o      ���� 0 anitem anItem y   �  r   ] i � � � n  ] e � � � I   ^ e�� ����� 0 findsigfile findSigFile �  ��� � o   ^ a���� 0 anitem anItem��  ��   �  f   ] ^ � o      ���� 0 _sigfile _sigFile �  ��� � Z   j � � ��� � � =  j q � � � o   j m���� 0 anitem anItem � o   m p���� 0 _sigfile _sigFile � r   t � � � � n  t | � � � I   u |�� �����  0 findtargetfile findTargetFile �  ��� � o   u x���� 0 anitem anItem��  ��   �  f   t u � o      ���� 0 _targetfile _targetFile��   � r   � � � � � o   � ����� 0 anitem anItem � o      ���� 0 _targetfile _targetFile��  ��   t k   � � � �  � � � r   � � � � � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� 0 _sel   � o      ���� 0 anitem anItem �  � � � r   � � � � � n  � � � � � I   � ��� ����� 0 findsigfile findSigFile �  ��� � o   � ����� 0 anitem anItem��  ��   �  f   � � � o      ���� 0 _sigfile _sigFile �  ��� � Z   � � � ��� � � =  � � � � � o   � ����� 0 anitem anItem � o   � ����� 0 _sigfile _sigFile � r   � � � � � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� 0 _sel   � o      ���� 0 _targetfile _targetFile��   � r   � � � � � o   � ����� 0 anitem anItem � o      ���� 0 _targetfile _targetFile��   q  � � � l  � ���������  ��  ��   �  ��� � Z   �j � ��� � � G   � � � � � =  � � � � � o   � ����� 0 _targetfile _targetFile � m   � � � � � � �   � =  � � � � � o   � ����� 0 _sigfile _sigFile � m   � � � � � � �   � k   � � � �  � � � I  � �������
�� .sysobeepnull��� ��� long��  ��   �  ��� � I  � ��� � �
�� .sysodlogaskr        TEXT � m   � � � � � � � h C o u l d   n o t   d e t e r m i n e   s i g n a t u r e   f i l e   f r o m   t a r g e t   f i l e . � �� � �
�� 
btns � J   � � � �  ��� � m   � � � � � � �  C a n c e l��   � �� � �
�� 
dflt � m   � � � � � � �  C a n c e l � �� ���
�� 
disp � m   � �����  ��  ��  ��   � k   �j � �  � � � r   � � � � n   � � � � � 1   � ���
�� 
psxp � l  � � ����� � c   � � � � � o   � ����� 0 _targetfile _targetFile � m   � ���
�� 
alis��  ��   � o      ���� 0 _targetfile _targetFile �  � � � r   � � � n   � � � 1  ��
�� 
psxp � l  ����� � c   � � � o  ���� 0 _sigfile _sigFile � m  
��
�� 
alis��  ��   � o      ���� 0 _sigfile _sigFile �  ��� � Q  j � � � � k  E � �  � � � r  < � � � I 8�� ��
�� .sysoexecTEXT���     TEXT � b  4 � � � b  0 � � � b  , � � � b  ( � � � b  $ � � � b    � � � m   � � � � � > / u s r / l o c a l / b i n / g p g   - - k e y s e r v e r   � o  �~�~ 0 
_keyserver   � m   #   � �   - - k e y s e r v e r - o p t i o n s   a u t o - k e y - r e t r i e v e , i n c l u d e - s u b k e y s   - - v e r i f y - o p t i o n s   s h o w - p h o t o s   - - v e r i f y   " � o  $'�}�} 0 _sigfile _sigFile � m  (+ �  "   " � o  ,/�|�| 0 _targetfile _targetFile � m  03 �  "   2 > & 1�   � o      �{�{ 0 res   � �z n =E I  >E�y	�x�y 0 parsegpgres parseGPGRes	 
�w
 o  >A�v�v 0 res  �w  �x    f  =>�z   � R      �u
�u .ascrerr ****      � **** o      �t�t 0 errtext errText �s�r
�s 
errn o      �q�q 0 errnum errNum�r   � I Mj�p
�p .sysodisAaleR        TEXT m  MP � L E r r o r :   G P G   S i g n a t u r e   V a l i d a t i o n   F a i l e d �o
�o 
mesS o  ST�n�n 0 errtext errText �m
�m 
as A m  WZ�l
�l EAlTcriT �k
�k 
btns J  [` �j m  [^ �  O K�j   �i�h
�i 
dflt m  ad �  O K�h  ��  ��  ��   + m     �                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   '  !  l     �g�f�e�g  �f  �e  ! "#" i    $%$ I      �d&�c�d 0 parsegpgres parseGPGRes& '�b' o      �a�a 0 res  �b  �c  % k    z(( )*) r     +,+ m     -- �..  , o      �`�` 0 _message  * /0/ r    121 J    �_�_  2 o      �^�^ 
0 _lines  0 343 r   	 565 n  	 787 1   
 �]
�] 
txdl8 1   	 
�\
�\ 
ascr6 o      �[�[ 0 _oldatid _oldATID4 9:9 r    ;<; I   �Z=�Y
�Z .sysontocTEXT       shor= m    �X�X �Y  < n     >?> 1    �W
�W 
txdl? 1    �V
�V 
ascr: @A@ Q    3BCDB r    !EFE n    GHG 2   �U
�U 
citmH o    �T�T 0 res  F o      �S�S 
0 _lines  C R      �RI�Q
�R .ascrerr ****      � ****I o      �P�P 0 _err  �Q  D O  ) 3JKJ I  - 2�OL�N
�O .sysodlogaskr        TEXTL o   - .�M�M 0 _err  �N  K m   ) *MM�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  A NON r   4 9PQP o   4 5�L�L 0 _oldatid _oldATIDQ n     RSR 1   6 8�K
�K 
txdlS 1   5 6�J
�J 
ascrO TUT l  : :�I�H�G�I  �H  �G  U VWV Z   :QXY�FZX =  : >[\[ o   : ;�E�E 
0 _lines  \ J   ; =�D�D  Y k   A ]]] ^_^ I  A F�C�B�A
�C .sysobeepnull��� ��� long�B  �A  _ `�@` O  G ]aba I  K \�?cd
�? .sysodlogaskr        TEXTc m   K Lee �ff l C o u l d   n o t   d e t e r m i n e   s i g n a t u r e   s t a t u s   f r o m   g p g   r e s u l t s .d �>gh
�> 
btnsg J   M Pii j�=j m   M Nkk �ll  C a n c e l�=  h �<mn
�< 
dfltm m   Q Roo �pp  C a n c e ln �;q�:
�; 
dispq m   U V�9�9  �:  b m   G Hrr�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �@  �F  Z k   `Qss tut r   ` kvwv n   ` ixyx m   e i�8
�8 
nmbry n  ` ez{z 2  a e�7
�7 
cobj{ o   ` a�6�6 
0 _lines  w o      �5�5 0 num  u |�4| Y   lQ}�3~�2} k   vL�� ��� r   v ~��� n   v |��� 4   w |�1�
�1 
cobj� o   z {�0�0 0 indx  � o   v w�/�/ 
0 _lines  � o      �.�. 	0 _line  � ��� l   �-���-  � &   Look for 'Good Signature' lines   � ��� @   L o o k   f o r   ' G o o d   S i g n a t u r e '   l i n e s� ��,� Z   L����+� C    ���� o    ��*�* 	0 _line  � m   � ��� ��� 0 g p g :   G o o d   s i g n a t u r e   f r o m� k   � ��� ��� r   � ���� n  � ���� I   � ��)��(�) 0 removeprefix removePrefix� ��� o   � ��'�' 	0 _line  � ��&� m   � ��� ��� 
 g p g :  �&  �(  �  f   � �� o      �%�% 	0 _line  � ��� r   � ���� b   � ���� b   � ���� o   � ��$�$ 0 _message  � o   � ��#�# 	0 _line  � o   � ��"
�" 
ret � o      �!�! 0 _message  � ��� l  � �� ���   � < 6 get all 'aka' lines following a 'Good signature' line   � ��� l   g e t   a l l   ' a k a '   l i n e s   f o l l o w i n g   a   ' G o o d   s i g n a t u r e '   l i n e� ��� Y   � ������� k   � ��� ��� r   � ���� n   � ���� 4   � ���
� 
cobj� o   � ��� 0 jndx  � o   � ��� 
0 _lines  � o      �� 	0 _next  � ��� Z   � ������ C   � ���� o   � ��� 	0 _next  � m   � ��� ��� 0 g p g :                                   a k a� k   � ��� ��� r   � ���� o   � ��� 0 jndx  � o      �� 0 indx  � ��� r   � ���� n  � ���� I   � ����� 0 removeprefix removePrefix� ��� o   � ��� 	0 _next  � ��� m   � ��� ��� * g p g :                                  �  �  �  f   � �� o      �� 	0 _next  � ��� r   � ���� b   � ���� b   � ���� b   � ���� o   � ��� 0 _message  � 1   � ��
� 
tab � o   � ��� 	0 _next  � o   � ��

�
 
ret � o      �	�	 0 _message  �  �  �  S   � ��  � 0 jndx  � l  � ����� [   � ���� o   � ��� 0 indx  � m   � ��� �  �  � o   � ��� 0 num  �  �  � ��� C   � ���� o   � ��� 	0 _line  � m   � ��� ���  g p g :   W A R N I N G :  � ��� k   �H�� ��� r   � ���� n  � ���� I   � ���� � 0 removeprefix removePrefix� ��� o   � ����� 	0 _line  � ���� m   � ��� ��� 
 g p g :  ��  �   �  f   � �� o      ���� 	0 _line  � ��� r   � ��� b   � ���� b   � ���� o   � ����� 0 _message  � o   � ����� 	0 _line  � o   � ���
�� 
ret � o      ���� 0 _message  � ��� l ������  � < 6 get all 'aka' lines following a 'Good signature' line   � �   l   g e t   a l l   ' a k a '   l i n e s   f o l l o w i n g   a   ' G o o d   s i g n a t u r e '   l i n e�  Y  @���� k  ;  r  	
	 n   4  ��
�� 
cobj o  ���� 0 jndx   o  ���� 
0 _lines  
 o      ���� 	0 _next   �� Z  ;�� C   o  ���� 	0 _next   m   �  g p g :                     k  7  r  ! o  ���� 0 jndx   o      ���� 0 indx    r  "- n "+  I  #+��!���� 0 removeprefix removePrefix! "#" o  #$���� 	0 _next  # $��$ m  $'%% �&&  g p g :                    ��  ��     f  "# o      ���� 	0 _next   '��' r  .7()( b  .5*+* b  .1,-, o  ./���� 0 _message  - o  /0���� 	0 _next  + o  14��
�� 
ret ) o      ���� 0 _message  ��  ��    S  :;��  �� 0 jndx   l .����. [  /0/ o  ���� 0 indx  0 m  ���� ��  ��   o  ���� 0 num  ��   1��1 r  AH232 b  AF454 o  AB���� 0 _message  5 o  BE��
�� 
ret 3 o      ���� 0 _message  ��  �  �+  �,  �3 0 indx  ~ m   o p����  o   p q���� 0 num  �2  �4  W 6��6 O Rz787 r  Vy9:9 n  Vw;<; 1  sw��
�� 
bhit< l Vs=����= I Vs��>?
�� .sysodisAaleR        TEXT> m  VY@@ �AA 0 G P G   S i g n a t u r e   V a l i d a t i o n? ��BC
�� 
mesSB o  \]���� 0 _message  C ��DE
�� 
as AD m  `c��
�� EAlTinfAE ��FG
�� 
btnsF J  diHH I��I m  dgJJ �KK  O K��  G ��L��
�� 
dfltL m  jmMM �NN  O K��  ��  ��  : o      ���� 0 	retbutton 	retButton8 m  RSOO�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  # PQP l     ��������  ��  ��  Q RSR i    TUT I      ��V���� 0 findsigfile findSigFileV W��W o      ���� 0 analias anAlias��  ��  U k     ~XX YZY r     [\[ n     ]^] 1    ��
�� 
pnam^ o     ���� 0 analias anAlias\ o      ���� 	0 _name  Z _`_ Y    5a��bc��a k    0dd efe r    #ghg n    !iji 4    !��k
�� 
cobjk o     ���� 0 indx  j o    ���� 0 _sig_file_extensions  h o      ���� 0 _ext  f l��l Z   $ 0mn����m D   $ 'opo o   $ %���� 	0 _name  p o   % &���� 0 _ext  n L   * ,qq o   * +���� 0 analias anAlias��  ��  ��  �� 0 indx  b m   	 
���� c n   
 rsr m    ��
�� 
nmbrs n  
 tut 2   ��
�� 
cobju o   
 ���� 0 _sig_file_extensions  ��  ` vwv r   6 >xyx n  6 <z{z I   7 <��|���� 0 getparentpath getParentPath| }��} o   7 8���� 0 analias anAlias��  ��  {  f   6 7y o      ���� 0 _pwd  w ~~ Y   ? {�������� k   R v�� ��� r   R \��� n   R Z��� 4   W Z���
�� 
cobj� o   X Y���� 0 indx  � o   R W���� 0 _sig_file_extensions  � o      ���� 0 _ext  � ��� r   ] d��� b   ] b��� b   ] `��� o   ] ^���� 0 _pwd  � o   ^ _���� 	0 _name  � o   ` a���� 0 _ext  � o      ���� 0 _tmppath _tmpPath� ���� Z   e v������� n  e k��� I   f k������� 0 isthere isThere� ���� o   f g���� 0 _tmppath _tmpPath��  ��  �  f   e f� L   n r�� l  n q������ c   n q��� o   n o���� 0 _tmppath _tmpPath� m   o p��
�� 
alis��  ��  ��  ��  ��  �� 0 indx  � m   B C���� � n   C M��� m   J L��
�� 
nmbr� n  C J��� 2  H J��
�� 
cobj� o   C H���� 0 _sig_file_extensions  ��   ���� L   | ~�� m   | }�� ���  ��  S ��� l     ��������  ��  ��  � ��� i    ��� I      �������  0 findtargetfile findTargetFile� ���� o      ���� 0 analias anAlias��  ��  � k     h�� ��� r     ��� n     ��� 1    ��
�� 
pnam� o     ���� 0 analias anAlias� o      ���� 	0 _name  � ��� r    	��� m    �� ���  � o      ���� 0 sigext sigExt� ��� Y   
 <�������� k    7�� ��� r    '��� n    %��� 4   " %���
�� 
cobj� o   # $���� 0 indx  � o    "���� 0 _sig_file_extensions  � o      ���� 0 _ext  � ��� Z   ( 7���~�}� D   ( +��� o   ( )�|�| 	0 _name  � o   ) *�{�{ 0 _ext  � k   . 3�� ��� r   . 1��� o   . /�z�z 0 _ext  � o      �y�y 0 sigext sigExt� ��x�  S   2 3�x  �~  �}  �  �� 0 indx  � m    �w�w � n    ��� m    �v
�v 
nmbr� n   ��� 2   �u
�u 
cobj� o    �t�t 0 _sig_file_extensions  ��  � ��� l  = =�s�r�q�s  �r  �q  � ��� Z   = e���p�� l  = @��o�n� =  = @��� o   = >�m�m 0 sigext sigExt� m   > ?�� ���  �o  �n  � L   C E�� o   C D�l�l 0 analais anAlais�p  � k   H e�� ��� r   H S��� n  H Q��� I   I Q�k��j�k "0 removeextension removeExtension� ��� c   I L��� o   I J�i�i 0 analias anAlias� m   J K�h
�h 
TEXT� ��g� o   L M�f�f 0 sigext sigExt�g  �j  �  f   H I� o      �e�e 0 _tmppath _tmpPath� ��d� Z   T e���c�b� n  T Z��� I   U Z�a��`�a 0 isthere isThere� ��_� o   U V�^�^ 0 _tmppath _tmpPath�_  �`  �  f   T U� L   ] a�� l  ] `��]�\� c   ] `��� o   ] ^�[�[ 0 _tmppath _tmpPath� m   ^ _�Z
�Z 
alis�]  �\  �c  �b  �d  � ��Y� L   f h�� m   f g�� ���  �Y  �    l     �X�W�V�X  �W  �V    i     I      �U�T�U 0 removeprefix removePrefix  o      �S�S 0 _str   	�R	 o      �Q�Q 0 _pre  �R  �T   k     

  r      n      2   �P
�P 
cha  o     �O�O 0 _str   o      �N�N 0 strchars strChars  r     n     m   	 �M
�M 
nmbr n    	 2   	�L
�L 
cha  o    �K�K 0 _pre   o      �J�J 0 prelen preLen �I L     c     l   �H�G n     7   �F !
�F 
cobj  l   "�E�D" [    #$# o    �C�C 0 prelen preLen$ m    �B�B �E  �D  !  ;     o    �A�A 0 strchars strChars�H  �G   m    �@
�@ 
TEXT�I   %&% l     �?�>�=�?  �>  �=  & '(' i    ")*) I      �<+�;�< "0 removeextension removeExtension+ ,-, o      �:�: 0 _str  - .�9. o      �8�8 0 _ext  �9  �;  * k      // 010 r     232 n     454 2   �7
�7 
cha 5 o     �6�6 0 _str  3 o      �5�5 0 strchars strChars1 676 r    898 n    :;: m   	 �4
�4 
nmbr; n    	<=< 2   	�3
�3 
cha = o    �2�2 0 _ext  9 o      �1�1 0 extlen extLen7 >�0> L     ?? c    @A@ l   B�/�.B n    CDC 7   �-EF
�- 
cobjE m    �,�, F l   G�+�*G \    HIH l   J�)�(J n    KLK m    �'
�' 
nmbrL o    �&�& 0 strchars strChars�)  �(  I o    �%�% 0 extlen extLen�+  �*  D o    �$�$ 0 strchars strChars�/  �.  A m    �#
�# 
TEXT�0  ( MNM l     �"�!� �"  �!  �   N OPO i   # &QRQ I      �S�� 0 getparentpath getParentPathS T�T o      �� 0 analias anAlias�  �  R O     UVU k    WW XYX r    	Z[Z n    \]\ m    �
� 
ctnr] o    �� 0 analias anAlias[ o      �� 	0 _cont  Y ^�^ L   
 __ c   
 `a` o   
 �� 	0 _cont  a m    �
� 
TEXT�  V m     bb�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  P cdc l     ����  �  �  d efe i   ' *ghg I      �i�� 0 isthere isTherei j�j o      �� 0 strfilepath strFilePath�  �  h k     *kk lml Q     'nopn c    qrq o    �� 0 strfilepath strFilePathr m    �
� 
aliso R      �st
� .ascrerr ****      � ****s o      �� 0 errtext errTextt �
u�	
�
 
errnu o      �� 0 errnum errNum�	  p Z    'vw�xv G    yzy l   {��{ =   |}| o    �� 0 errnum errNum} m    �����  �  z l   ~��~ =   � o    � �  0 errnum errNum� m    �����\�  �  w L    �� m    ��
�� boovfals�  x R   ! '�����
�� .ascrerr ****      � ****��  � �����
�� 
errn� o   # $���� 0 errnum errNum��  m ���� L   ( *�� m   ( )��
�� boovtrue��  f ���� l     ��������  ��  ��  ��       ���� "����������  � 
���������������������� 0 _sig_file_extensions  �� 0 
_keyserver  
�� .aevtoappnull  �   � ****�� 0 parsegpgres parseGPGRes�� 0 findsigfile findSigFile��  0 findtargetfile findTargetFile�� 0 removeprefix removePrefix�� "0 removeextension removeExtension�� 0 getparentpath getParentPath�� 0 isthere isThere� ����� �      � �� )��������
�� .aevtoappnull  �   � ****��  ��  � ������ 0 errtext errText�� 0 errnum errNum� 0������������ H�� N�� R������ ` f j���������� � ��� � � ����� � �������������������
�� 
sele�� 0 _sel  
�� 
cobj
�� 
nmbr�� 0 cnt  
�� .sysobeepnull��� ��� long
�� 
btns
�� 
dflt
�� 
disp�� 
�� .sysodlogaskr        TEXT�� 0 anitem anItem�� 0 findsigfile findSigFile�� 0 _sigfile _sigFile��  0 findtargetfile findTargetFile�� 0 _targetfile _targetFile
�� 
bool
�� 
alis
�� 
psxp
�� .sysoexecTEXT���     TEXT�� 0 res  �� 0 parsegpgres parseGPGRes�� 0 errtext errText� ������
�� 
errn�� 0 errnum errNum��  
�� 
mesS
�� 
as A
�� EAlTcriT�� 
�� .sysodisAaleR        TEXT��l�h*�,E�O��-�,E�O�j  *j O���kv���j� Y>�l *j O��a kv�a �j� Y�k  ;��k/E` O)_ k+ E` O_ _   )_ k+ E` Y 	_ E` Y 4��k/E` O)_ k+ E` O_ _   ��l/E` Y 	_ E` O_ a  
 _ a  a & *j Oa �a kv�a �j� Y x_ a &a ,E` O_ a &a ,E` O 3a b  %a  %_ %a !%_ %a "%j #E` $O)_ $k+ %W $X & 'a (a )�a *a +�a ,kv�a -a . /U� ��%���������� 0 parsegpgres parseGPGRes�� ����� �  ���� 0 res  ��  � ������������������������ 0 res  �� 0 _message  �� 
0 _lines  �� 0 _oldatid _oldATID�� 0 _err  �� 0 num  �� 0 indx  �� 	0 _line  �� 0 jndx  �� 	0 _next  �� 0 	retbutton 	retButton� (-��������������M����e��k��o��������������������%@������JM������
�� 
ascr
�� 
txdl�� 
�� .sysontocTEXT       shor
�� 
citm�� 0 _err  ��  
�� .sysodlogaskr        TEXT
�� .sysobeepnull��� ��� long
�� 
btns
�� 
dflt
�� 
disp�� 
�� 
cobj
�� 
nmbr�� 0 removeprefix removePrefix
�� 
ret 
�� 
tab 
�� 
mesS
�� 
as A
�� EAlTinfA�� 
�� .sysodisAaleR        TEXT
�� 
bhit��{�E�OjvE�O��,E�O�j ��,FO 
��-E�W X  � �j 	UO���,FO�jv  !*j 
O� ���kv��a ja  	UY �a -a ,E�O �k�kh �a �/E�O�a  ^)�a l+ E�O��%_ %E�O B�k�kh �a �/E�O�a  "�E�O)�a l+ E�O�_ %�%_ %E�Y [OY��Y k�a  b)�a l+ E�O��%_ %E�O >�k�kh �a �/E�O�a  �E�O)�a l+ E�O��%_ %E�Y [OY��O�_ %E�Y h[OY�$O� %a a  �a !a "�a #kv�a $a % &a ',E�U� ��U���������� 0 findsigfile findSigFile�� ����� �  ���� 0 analias anAlias��  � �������������� 0 analias anAlias�� 	0 _name  �� 0 indx  �� 0 _ext  �� 0 _pwd  �� 0 _tmppath _tmpPath� �������������
�� 
pnam
�� 
cobj
�� 
nmbr�� 0 getparentpath getParentPath�� 0 isthere isThere
�� 
alis�� ��,E�O .kb   �-�,Ekh b   �/E�O�� �Y h[OY��O)�k+ E�O ;kb   �-�,Ekh b   �/E�O��%�%E�O)�k+  	��&Y h[OY��O�� �������������  0 findtargetfile findTargetFile�� ����� �  ���� 0 analias anAlias��  � ����~�}�|�{�z�� 0 analias anAlias� 	0 _name  �~ 0 sigext sigExt�} 0 indx  �| 0 _ext  �{ 0 analais anAlais�z 0 _tmppath _tmpPath� 
�y��x�w��v�u�t�s�
�y 
pnam
�x 
cobj
�w 
nmbr
�v 
TEXT�u "0 removeextension removeExtension�t 0 isthere isThere
�s 
alis�� i��,E�O�E�O 1kb   �-�,Ekh b   �/E�O�� 
�E�OY h[OY��O��  �Y )��&�l+ E�O)�k+  	��&Y hO�� �r�q�p���o�r 0 removeprefix removePrefix�q �n��n �  �m�l�m 0 _str  �l 0 _pre  �p  � �k�j�i�h�k 0 _str  �j 0 _pre  �i 0 strchars strChars�h 0 prelen preLen� �g�f�e�d
�g 
cha 
�f 
nmbr
�e 
cobj
�d 
TEXT�o ��-E�O��-�,E�O�[�\[Z�k\62�&� �c*�b�a���`�c "0 removeextension removeExtension�b �_��_ �  �^�]�^ 0 _str  �] 0 _ext  �a  � �\�[�Z�Y�\ 0 _str  �[ 0 _ext  �Z 0 strchars strChars�Y 0 extlen extLen� �X�W�V�U
�X 
cha 
�W 
nmbr
�V 
cobj
�U 
TEXT�` !��-E�O��-�,E�O�[�\[Zk\Z��,�2�&� �TR�S�R���Q�T 0 getparentpath getParentPath�S �P��P �  �O�O 0 analias anAlias�R  � �N�M�N 0 analias anAlias�M 	0 _cont  � b�L�K
�L 
ctnr
�K 
TEXT�Q � ��,E�O��&U� �Jh�I�H���G�J 0 isthere isThere�I �F��F �  �E�E 0 strfilepath strFilePath�H  � �D�C�B�D 0 strfilepath strFilePath�C 0 errtext errText�B 0 errnum errNum� �A�@��?�>�=�<
�A 
alis�@ 0 errtext errText� �;�:�9
�; 
errn�: 0 errnum errNum�9  �?���>�\
�= 
bool
�< 
errn�G + ��&W  X  �� 
 �� �& fY )�lhOeascr  ��ޭ