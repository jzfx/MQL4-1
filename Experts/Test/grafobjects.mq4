//--------------------------------------------------------------------
// grafobjects.mq4
// ������������ ��� ������������� � �������� ������� � �������� MQL4.
//--------------------------------------------------------------------
int start()                            // ����. ������� start
  {
//--------------------------------------------------------------- 1 --
   int Sit;
   double MACD_M_0,MACD_M_1,           // ������� �����, 0 � 1 ���
   MACD_S_0,MACD_S_1;                  // ���������� �����, 0 � 1 ���
   string Text[4];                     // ���������� �������. �������
   color  Color[4];                    // ���������� ������� ������

   Text[0]= "�������� Buy";            // ����� ��� ��������� ��������
   Text[1]= "�������� Sell";
   Text[2]= "���������� Buy";
   Text[3]= "���������� Sell";

   Color[0]= DeepSkyBlue;              // ���� ������� ..
   Color[1]= LightPink;                // .. ��� ��������� ��������
   Color[2]= Yellow;
   Color[3]= Yellow;
//--------------------------------------------------------------- 2 --
   ObjectCreate("Label_Obj_MACD", OBJ_LABEL, 0, 0, 0);// �������� ���.
   ObjectSet("Label_Obj_MACD", OBJPROP_CORNER, 1);    // �������� ����
   ObjectSet("Label_Obj_MACD", OBJPROP_XDISTANCE, 10);// ���������� �
   ObjectSet("Label_Obj_MACD", OBJPROP_YDISTANCE, 15);// ���������� Y
//--------------------------------------------------------------- 3 --
   MACD_M_0 =iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,0);  // 0 ���
   MACD_S_0 =iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_SIGNAL,0);// 0 ���
   MACD_M_1 =iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,1);  // 1 ���
   MACD_S_1 =iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_SIGNAL,1);// 1 ���
//--------------------------------------------------------------- 4 --
   // ������ �������� 
   if(MACD_M_1<MACD_S_1 && MACD_M_0>=MACD_S_0)// ������. ����� �����
      Sit=0;
   if(MACD_M_1>MACD_S_1 && MACD_M_0<=MACD_S_0)// ������. ������ ����
      Sit=1;
   if(MACD_M_1>MACD_S_1 && MACD_M_0>MACD_S_0) // ������� ���� ����.
      Sit=2;
   if(MACD_M_1<MACD_S_1 && MACD_M_0<MACD_S_0) // ������� ���� ����.
      Sit=3;
//--------------------------------------------------------------- 5 --
   // ��������� ������� �������
   ObjectSetText("Label_Obj_MACD",Text[Sit],10,"Arial",Color[Sit]);
//--------------------------------------------------------------- 6 --
   return;                             // ����� �� start()
  }
//--------------------------------------------------------------- 7 --
int deinit()                           // ����. ������� deinit
   {
   ObjectDelete("Label_Obj_MACD");     // �������� �������
   return;                             // ����� �� deinit()
   }
//--------------------------------------------------------------- 8 --