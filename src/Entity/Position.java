package Entity;

public interface Position {
    default int[] decodePosition(String position){;
        int commaPos = position.indexOf(',');
        int lastParenthesis = position.indexOf(')');

        return new int[]{
                Integer.parseInt(position.substring(1,commaPos)),
                Integer.parseInt(position.substring(commaPos+1,lastParenthesis))
                };
    }
    void setPosition(int[] position);
}
