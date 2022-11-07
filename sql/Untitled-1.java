
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int M = in.nextInt();
        int N = in.nextInt();
        int S=0;
        for (int i = 0; i < N; i++) {
            int E = in.nextInt();
        S= S+ E % M;
        }
        System.out.print(S);
    }
}