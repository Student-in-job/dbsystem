/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TasKer.Core;

import TasKer.Tasks.Impl.Service;
import com.google.common.collect.Lists;
import com.google.gson.JsonObject;
import java.security.SignatureException;
import net.oauth.jsontoken.Checker;
import net.oauth.jsontoken.JsonToken;
import net.oauth.jsontoken.JsonTokenParser;
import net.oauth.jsontoken.crypto.HmacSHA256Signer;
import net.oauth.jsontoken.crypto.HmacSHA256Verifier;
import net.oauth.jsontoken.crypto.SignatureAlgorithm;
import net.oauth.jsontoken.crypto.Verifier;
import net.oauth.jsontoken.discovery.VerifierProvider;
import net.oauth.jsontoken.discovery.VerifierProviders;
import org.joda.time.Instant;

/**
 *
 * @author ksinn
 */
public class JWTHelper {
    
    public static JsonToken newJWT(String url) throws Exception{
        Service service = new Service();
        service.getById(1);
        HmacSHA256Signer signer;
        signer = new HmacSHA256Signer(url, null, service.getMyKey().getBytes());
        JsonToken token = new JsonToken(signer);
        token.setAudience(service.getURL());
        token.setIssuedAt(Instant.now());
        token.setExpiration(Instant.now().plus(60 * 1000));
        return token;
        
    }

    public static JsonToken parsJWT(String token) throws Exception {
        Service service = new Service();
        service.getById(1);
        final Verifier hmacVerifier = new HmacSHA256Verifier(service.getServiceKey().getBytes());

        VerifierProvider hmacLocator = new VerifierProvider() {

            @Override
            public java.util.List<Verifier> findVerifier(String id, String key) {
                return Lists.newArrayList(hmacVerifier);
            }
        };
        VerifierProviders locators = new VerifierProviders();
        locators.setVerifierProvider(SignatureAlgorithm.HS256, hmacLocator);
        net.oauth.jsontoken.Checker checker = new Checker() {

            @Override
            public void check(JsonObject payload) throws SignatureException {
                // don't throw - allow anything
            }

        };
        //Ignore Audience does not mean that the Signature is ignored
        JsonTokenParser parser = new JsonTokenParser(locators, checker);
        JsonToken jt = parser.verifyAndDeserialize(token);
        return jt;

    }
    
    public static boolean check(JsonToken jt, String audience){
        if(jt.getExpiration().getMillis()<System.currentTimeMillis()) return false;
        return audience.equals(jt.getAudience());        
    }

}
