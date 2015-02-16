/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes.objetos;

/**
 *
 * @author gerardo
 */
public class Totales
   {
        private String descripcion;
        private float total;
        
        public Totales(String descripcion, float total)
        {
            this.descripcion = descripcion;
            this.total = total;
        }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
        
        
        
        
   }
