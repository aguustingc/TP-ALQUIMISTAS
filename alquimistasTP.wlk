object alquimista{
	
	var itemsDeCombate = []
	var itemsDeRecoleccion = []
	
	method tieneCriterio(){
		return self.cantidadDeItemsDeCombateEfectivos() >= self.cantidadDeItemsDeCombate()/2
	}
	
	method cantidadDeItemsDeCombate(){
		return itemsDeCombate.size()
	}
	
	method cantidadDeItemsDeCombateEfectivos(){
		return itemsDeCombate.count({itemDeCombate => itemDeCombate.esEfectivo()}) 
	}
	
	method agregarItem(unItem){
		itemsDeCombate.add(unItem)
	}
	
	method esBuenExplorador(){
		return self.cantidadDeItemsDeRecoleccion() >= 3
	}
	
	method cantidadDeItemsDeRecoleccion(){
		return itemsDeRecoleccion.size() 
	}
	
	method agregarItemDeRecoleccion(unItem){
		itemsDeRecoleccion.add(unItem)
	}
	
	method capacidadOfensiva(){
		return itemsDeCombate.sum{item => item.capacidadOfensiva()}
	}
	
	method esProfesional(){
		return (self.calidadPromedioItems()>50 and self.todosSusItemsDeCombateSonEfectivos() and self.esBuenExplorador())
	}
	
	method calidadPromedioItems(){
		return self.sumaDeCalidad() / self.sumaDeCantidadDeItems() 
	}
	
	method sumaDeCalidad(){
		return self.calidadItemsCombate() + self.calidadMaterialesRecoleccion() + self.cantidadDeItemsDeRecoleccion()	
	}
	
   	method calidadItemsCombate(){
 		return itemsDeCombate.map{item => item.calidad()}.sum()
 	}
 	method calidadMaterialesRecoleccion(){
 		return itemsDeRecoleccion.map{item => item.calidad()}.sum()
 	}
 	method calidadItemsDeRecoleccion(){
 		return 30 + self.calidadMaterialesRecoleccion() / 10
 	}
    method sumaDeCantidadDeItems(){
        return itemsDeCombate.size() + itemsDeRecoleccion.size()
    }

	method todosSusItemsDeCombateSonEfectivos(){
		return itemsDeCombate.all{unItem => unItem.esEfectivo()}
	}
}

object bomba{
	
	var danio = 150
	
	method esEfectivo() {
		return danio > 100
	}
	
	method capacidadOfensiva(){
		return danio/2
	}
	
	method calidad(){
		return 80
	}
}

object pocion{
	
	var materiales = []
	var poderCurativo = 25
	
	method esEfectivo(){
		return poderCurativo > 50 and self.fueCreadaConAlgunMaterialMistico()
	}
	
	method fueCreadaConAlgunMaterialMistico(){
		return materiales.any ({material => material.esMistico()})
	}
	
	method esMistico(){
		return true	
	}
	
	method capacidadOfensiva(){
		return poderCurativo + 10*self.cantidadMaterialesMisticos()
	}
	
	method cantidadMaterialesMisticos(){
		return materiales.count{material => material.esMistico()}
	}
	
	method calidad(){
		return 100
	}
}

object debilitador{
	
	var materiales = []
	var potencia = 0
		
	method esEfectivo(){
		return (potencia > 0) and self.fueCreadoPorAlgunMaterialMistico().negate()	
	}
	
	method fueCreadoPorAlgunMaterialMistico(){
		return materiales.any ({material => material.esMistico()})
	}
	
	method esMistico(){
		return true	
	}
	
	method capacidadOfensiva(){
        if(self.fueCreadoPorAlgunMaterialMistico()){
            return 12 * self.cantidadDeMateriales()
        }else{
            return 5
        }
    }

    method cantidadDeMateriales(){
        return materiales.size()
    }
    
    method calidad(){
		return 150
	}
}