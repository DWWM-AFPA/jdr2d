public abstract class Position {
    public void decodePosition(String position){
        position = "(20,50)";
        int commaPos = position.indexOf(',');
        int lastParenthesis = position.indexOf(')');

        this.setX(Integer.parseInt(position.substring(1,commaPos)));
        this.setY(Integer.parseInt(position.substring(commaPos+1,lastParenthesis)));
    }
}
