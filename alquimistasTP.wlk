object alquimista{
	
	var itemsDeCombate = []
	
	method tieneCriterio(){
		return self.cantidadDeItemsDeCombateEfectivos() >= self.cantidadDeItemsDeCombate()/2
	}
	
	method cantidadDeItemsDeCombate(){
		return itemsDeCombate.size()
	}
	
	method cantidadDeItemsDeCombateEfectivos(){
		return itemsDeCombate.count({itemDeCombate => itemDeCombate.esEfectivo()}) //CUENTA LOS QUE CUMPLEN ESE CRITERIO Y TE DICE LA CANTIDAD
	}
	
	method agregarItem(unItem){
		itemsDeCombate.add(unItem)
	}
}

object bomba{
	
	var danio = 150
	
	method esEfectivo() {
		return danio > 100
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
}