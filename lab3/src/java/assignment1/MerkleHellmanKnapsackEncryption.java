package assignment1;

import java.math.BigInteger;
import java.util.Random;


public class MerkleHellmanKnapsackEncryption {

    private BigIntegerLinkedList w;
    private BigIntegerLinkedList b;
    private BigInteger q;
    private BigInteger r;
    public int inputSize = 640; 

    public MerkleHellmanKnapsackEncryption() {
        w = new BigIntegerLinkedList();
        b = new BigIntegerLinkedList();
    }

    
    public BigInteger encrypt(byte[] input) {
        if (input.length > 80) {
            return null;
        }

        
        generateKeys(input.length * 8);

        
        BigInteger encryptedMessage = new BigInteger("0");
        byte mask = 0x01;

        
        inputSize = input.length * 8;

        
        for (int i = 0; i < input.length; i++) {
            byte inputByte = input[i];
            for (int j = 0; j < 8; j++) {
                BigInteger bValue = b.get(i * 8 + 7 - j).getData();
                if ((inputByte & (mask << j)) != 0) {
                    encryptedMessage = encryptedMessage.add(bValue);
                }
            }
            mask = 0x01;
        }

        return encryptedMessage;
    }

   
    public byte[] decrypt(BigInteger output) {

        BigInteger b1 = output.mod(q);
        BigInteger b2 = r.modInverse(q);
        BigInteger b3 = b1.multiply(b2);

        
        BigInteger value = b3.mod(q);

        
        int[] bitMask = new int[inputSize];

        
        for (int i = inputSize - 1; value.compareTo(new BigInteger("0")) != 0; i--) {
            BigInteger keyValue = w.get(i).getData();
            if (value.compareTo(keyValue) >= 0) {
                value = value.subtract(keyValue);
                bitMask[i] = 1;
            }
        }

        
        byte[] decrypted = new byte[bitMask.length / 8];
        byte mask = 0x01;

        for (int i = 0; i < bitMask.length; i++) {
            if (bitMask[i] == 1) {
                decrypted[i / 8] = (byte) (decrypted[i / 8] | (mask << (7 - i % 8)));
            }
            mask = 0x01;
        }

        return decrypted;
    }

    
    public void generateKeys(int inputSize) {
        
        w.addNode(new BigInteger("1"));
        for (int i = 1; i < inputSize; i++) {
            w.addNode(nextSuperIncreasingNumber(w));
        }
        
        q = nextSuperIncreasingNumber(w);

        
        Random random = new Random();
       
        do {
            r = q.subtract(new BigInteger(random.nextInt(1000) + ""));
        } while ((r.compareTo(new BigInteger("0")) > 0) && (q.gcd(r).intValue() != 1));

        
        for (int i = 0; i < inputSize; i++) {
            b.addNode(w.get(i).getData().multiply(r).mod(q));
        }
    }

   
    private BigInteger nextSuperIncreasingNumber(BigIntegerLinkedList list) {
        BigIntegerNode node;
        BigInteger sum = new BigInteger("0"); 
        int i = 0;

        
        while ((node = list.get(i)) != null) {
            sum = sum.add(node.getData());
            i++;
        }
        Random random = new Random();

        
        return sum.add(new BigInteger(random.nextInt(5) + 1 + ""));
    }
}
