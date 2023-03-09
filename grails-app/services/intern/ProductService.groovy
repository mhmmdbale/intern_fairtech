package intern

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class ProductService {

    def getAllColor(){
        List<Color> colors = Color.list()
        return colors
    }

    void addDataColor(GrailsParameterMap params) {

        Color color = new Color()
        color.code = params.code
        color.name = params.name

        color.save(flush: true)
    }

    void updateDataColor(long id, GrailsParameterMap params){
        Color color = Color.findById(id)
        color.code = params.code
        color.name = params.name

        color.save(flush: true)
    }

    void deleteDataColor(long id){
        Color color = Color.findById(id)
        if (color) {
            ProductColor.where { color == color }.deleteAll()
            color.delete()
        }
    }
}
