package Jdr_2D_Simple;

public abstract class Point {

    protected int xPosition;
    protected int yPosition;

    public int getxPosition() {
        return xPosition;
    }

    public Point setxPosition(int xPosition) {
        this.xPosition = xPosition;
        return this;
    }

    public int getyPosition() {
        return yPosition;
    }

    public Point setyPosition(int yPosition) {
        this.yPosition = yPosition;
        return this;
    }

    public Point(int xPosition, int yPosition) {
        this.xPosition = xPosition;
        this.yPosition = yPosition;
    }
}
