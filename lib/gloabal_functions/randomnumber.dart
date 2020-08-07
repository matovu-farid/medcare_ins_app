import 'dart:math';

int randomGen(int first,int second){
  Random random =  Random(first);
return random.nextInt(second);

}