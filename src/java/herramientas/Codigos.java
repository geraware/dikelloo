/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package herramientas;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
//import net.sourceforge.jbarcodebean.JBarcodeBean;
//import net.sourceforge.jbarcodebean.model.Code128;

/**
 *
 * @author gerardo
 */
public class Codigos 
{
    
    public String getBarCode(String code, String ruta) throws IOException
    {
        //JBarcodeBean barcode = new JBarcodeBean();

        // nuestro tipo de codigo de barra
        //barcode.setCodeType(new Interleaved25());
        //barcode.setCodeType(new Code128());

        // nuestro valor a codificar y algunas configuraciones mas
        //barcode.setCode(code);
        //barcode.setCheckDigit(true);
        //barcode.setSize(200, 70);
        //BufferedImage bufferedImage = barcode.draw(new BufferedImage(200, 70, BufferedImage.TYPE_INT_RGB));

        // guardar en disco como png
        //File file = new File(ruta + "/barcode.png");
        //ImageIO.write(bufferedImage, "png", file);
        
        return "barcode.png";
    }
    
}
