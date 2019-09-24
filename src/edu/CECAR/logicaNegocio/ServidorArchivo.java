/**
 * Clase: ServidorArchivo.java
 *
 * Version: 1.0
 *
 * Fecha creación: 26/09/2018
 *
 * Ultima Fecha  Modificacion:
 *
 * Autor: Ing. Jhon Jaime Mendez Alandete
 *
 * Copyright: CECAR
 */


package edu.CECAR.logicaNegocio;

/**
 * Servidor que permite la subida y descarga de archivos desde y hacia los clientes
 */

import java.io.IOException;

import edu.CECAR.componentes.Utilidades;
import edu.CECAR.componentes.comunicaciones.ServerSocketObjeto;
import edu.CECAR.objetosRemotos.Archivo;

public class ServidorArchivo {
	
	private String ruta = "ArchivosCompartidos/";
	
	public ServidorArchivo(int puerto) {
	
			
			System.out.println("Servidor de Archivos Montado");
				
			ServerSocketObjeto serverSocket = new ServerSocketObjeto(puerto); // Se bloquea esperando conexion
			
			boolean sw = true;
			
			while (sw) {
		
				try {
					
					//Se bloque esperando un objeto que sea enviado por el cliente
					Object object = serverSocket.getEntrada().readObject();
					
					//Se realiza la conversión a un objeto de tipo Archivo
					Archivo archivo = (Archivo)object;
					
					if (archivo.getOperacion().equals("Subida")) { //se verifica si se sube o descarga
						
						Utilidades.escribirAchivo(ruta + archivo.getNombre(), archivo.getBytes());
						
						
					} else {
						
						byte[] bytes = Utilidades.getBytes(ruta + archivo.getNombre());
						archivo.setBytes(bytes);
						serverSocket.getSalida().writeObject(archivo);
						
					}
				
				
				} catch (IOException e) {
					
					System.out.println("Conexión cerrada de manera inesperada. " + e);
					sw = false;
					
				} catch (ClassNotFoundException e) {
					
					e.printStackTrace();
					
				} catch (Exception e) {
					
					e.printStackTrace();
				}
			
			}
			
	}

}
