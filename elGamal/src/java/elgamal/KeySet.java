/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package elgamal;

import java.math.BigInteger;
import java.security.SecureRandom;

/**
 *
 * @author oorestisime
 */
public class KeySet {
    private PublicKey pk;
    private SecretKey sk;
    private Parameters params;
    private int nb_bits;
    
    
    public KeySet(PublicKey _pk,SecretKey _sk,int nbb){
        this.pk=_pk;
        this.sk=_sk;
       this.nb_bits=nbb; 
    }
    public KeySet(int nbb){
        //System.out.print(nbb);
        KeySet(new Parameters(nbb,new SecureRandom())); 
    }
    public void KeySet(Parameters par){
        this.params=par;
        this.nb_bits=par.getNb_bits();
        BigInteger p=Elgamal.getPrime_cert(nb_bits, this.params.getPrg(), 100);
        BigInteger p_prime=(p.subtract(BigInteger.ONE)).divide(new BigInteger("2"));
        //System.out.println("p---->"+p+"  et  p prime   "+p_prime);
        BigInteger g;
        boolean found=false;
        do{
                g = new BigInteger(p.bitCount()-1, new SecureRandom());
                if(p.compareTo(g)==1 && g.modPow(p_prime, p).equals(BigInteger.ONE) && !g.modPow(new BigInteger("2"), p).equals(BigInteger.ONE)){
                    found=true;
                }
            } while(!found);
  
        //System.out.println("g  -> "+g);
        BigInteger x;
        do{
        x = new BigInteger(p_prime.bitCount()-1, new SecureRandom());
        }while(p_prime.compareTo(x)==-1);
        //System.out.println("x  -> "+x);
        BigInteger h=g.modPow(x, p);
        //System.out.println("h  -> "+h);
        PublicKey pk=new PublicKey(p,h,g);
        SecretKey sk=new SecretKey(p,x);
        this.pk=pk;
        this.sk=sk;
    }

    /**
     * @return the pk
     */
    public PublicKey getPk() {
        return pk;
    }

    /**
     * @return the sk
     */
    public SecretKey getSk() {
        return sk;
    }

    /**
     * @return the params
     */
    public Parameters getParams() {
        return params;
    }

    /**
     * @return the nb_bits
     */
    public int getNb_bits() {
        return nb_bits;
    }
    
}
