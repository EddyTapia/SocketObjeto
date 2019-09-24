/**
 * Clase: Cliente.java
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
 *  Clase cliente que permite la subida y descarga de archivo hacia y desde el servidor
 * 
 */

import edu.CECAR.componentes.Utilidades;
import edu.CECAR.componentes.comunicaciones.SocketObjeto;
import edu.CECAR.objetosRemotos.Archivo;

public class Cliente {
	
	
	public Cliente(String IPServidor, int puerto) {
		
		
		
		try {
			
			SocketObjeto socketObjeto = new SocketObjeto(IPServidor, puerto);
			String ruta = "ArchivoPrueba/";
			System.out.println("Me conecte");
			
			//*** Se inicia la subida de un  archivo **********************************
			String nombreArchivo = "bd.sql";
			Archivo archivo = new Archivo(nombreArchivo,Utilidades.getBytes(ruta + nombreArchivo), "Subida");
			socketObjeto.getSalida().writeObject(archivo);
			System.out.println("Archivo subido con exito");
			//**************************************************************************
			
			//*** Se inicia la descarga de un  archivo **********************************
			archivo = new Archivo("Examples.xlsx", "Descarga");
			socketObjeto.getSalida().writeObject(archivo);
			Object object = socketObjeto.getEntrada().readObject();
			archivo =(Archivo)object; 
			Utilidades.escribirAchivo(ruta + "Examples.xlsx", archivo.getBytes());
			System.out.println("Archivo Descargado con exito");
			//**************************************************************************
			
			Thread.sleep(1000); //Se bloquea por lo explicado en clase
			System.out.println("Cerrando conexión");
			
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
