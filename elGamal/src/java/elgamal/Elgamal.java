/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package elgamal;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author oorestisime
 */
public class Elgamal {

    private int nbits;
    private KeySet kset;
    
    public Elgamal(KeySet _keys,int nbb){
        this.kset=_keys;
        this.nbits=nbb;
    }
    public CipherText encrypt(BigInteger[] pt){
        BigInteger modulo=kset.getPk().getP();
        CipherText ct;
        BigInteger mhr[]=new BigInteger[pt.length];
        BigInteger r;
        do{
            r = new BigInteger(modulo.bitCount()-1, new SecureRandom());
        }while(kset.getPk().getP().compareTo(r)==-1);
        
        for(int i=0;i<pt.length;i++){
           mhr[i]=(pt[i].multiply(kset.getPk().getH().modPow(r, modulo))).mod(modulo);
        }
        BigInteger gr=kset.getPk().getG().modPow(r,modulo);
        ct=new CipherText(mhr,gr);
        return ct;
    }
    public CipherText encrypt(String s){
        CipherText cipherT;
        byte bytes[]=null;
        try {
            bytes = s.getBytes("UTF-8");
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(Elgamal.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        byte[][] chuncked =divideArray(bytes, 31);
       
        byte lastchunck[]=new byte[s.length()%31];
        int j=0;
        for(int i=0;i<chuncked[0].length;i++){
            if(chuncked[chuncked.length-1][i]!=(byte)0){
               lastchunck[j]=(byte)(chuncked[chuncked.length-1][i]);
               j++;
             }
        }
        
        BigInteger[] chuncks=new BigInteger[chuncked.length];
        for(int w=0;w<chuncks.length-1;w++){
            chuncks[w]=new BigInteger(chuncked[w]);
            
        }
        
        chuncks[chuncks.length-1]=new BigInteger(lastchunck);
       
        cipherT=encrypt(chuncks);
        return cipherT;
    }
    public BigInteger[] decrypt(CipherText ct){
        BigInteger mod=kset.getPk().getP();
        BigInteger tmp;
        BigInteger plain[]=new BigInteger[ct.getCt().length];
        for(int i=0;i<plain.length;i++){
            tmp=ct.getGr().modPow(kset.getSk().getX(), mod);
            plain[i]=ct.getCt()[i].multiply(tmp.modInverse(mod)).mod(mod);
        }
       return plain;
    }
    public static byte[][] divideArray(byte[] source, int chunksize) {
        byte[][] ret = new byte[(int)Math.ceil(source.length / (double)chunksize)][chunksize];
        int start = 0;
        for(int i = 0; i < ret.length; i++) {
            ret[i] = Arrays.copyOfRange(source,start, start + chunksize);
            start += chunksize ;
        }
        return ret;
    }
    public String PtToString(BigInteger[] pt){
        String res="";
        for(int i=0;i<pt.length;i++){
            res+=new String(pt[i].toByteArray());
        }
        return res;
    }
    
    public static BigInteger getPrime(int nb_bits, Random rng){
       BigInteger fois=new BigInteger("2");
       BigInteger p_prime,p;
       do{
         p_prime=BigInteger.probablePrime(nb_bits,rng);
         p=p_prime.multiply(fois).add(BigInteger.ONE);
       }while(!p.isProbablePrime(100));
       return p;
    }
    
    public static BigInteger getPrime_cert(int nb_bits, Random rng,int cert){
       BigInteger fois=new BigInteger("2");
       BigInteger p_prime,p;
       do{
         p_prime=BigInteger.probablePrime(nb_bits-1,rng);
         p=p_prime.multiply(fois).add(BigInteger.ONE);
       }while(!p.isProbablePrime(cert));
       
       return p;
    }
    
}
