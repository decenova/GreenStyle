function getBrandAndTypeByCategoryId(cateId) {
    getBrand(cateId);
    getType(cateId);
}
function getBrand(cateId) {
    var div_brand_select = $('#brand_select');
    $.ajax({
        url: '/get_brand_by_cate_id',
        method: 'get',
        data: {category_id: cateId},
        success: function(data) {
            var brands_data = data.brands
            div_brand_select.empty();
            div_brand_select.append("<select id='brand_select_id'>");
            for(i = 0; i < brands_data.length; i++) {
                $('#brand_select_id')
                .append("<option value='" + brands_data[i].id + "'>"
                + brands_data[i].name + "</option>");
            }
            div_brand_select.append("</select>");
        }
    })
}
function getType(cateId) {
    var div_type_check = $('#type_check');
    $.ajax({
        url: '/get_type_by_cate_id',
        method: 'get',
        data: {category_id: cateId},
        success: function(data) {
            var cates_types = data.cate_types
            div_type_check.empty();
            for(i = 0; i < cates_types.length; i++) {
                div_type_check.append("<div id='parent_type_" 
                + cates_types[i].id + "'>" + cates_types[i].name + "</div>");
                getSubTypeByParentType(cates_types[i].id);
            }
        }
    })
}
function getSubTypeByParentType(typeId) {
    $.ajax({
        url: '/get_subtype_by_type_id',
        method: 'get',
        data: {type_id: typeId},
        success: function(data) {
            subtypes = data.subtypes;
            $('#parent_type_' + typeId).append("<br/>");
            for(i = 0; i < subtypes.length; i++) {
                $('#parent_type_' + typeId).append("<input type='checkbox' name='" 
                + subtypes[i].id + "' value='" + subtypes[i].name + "'>"
                + subtypes[i].name + "</input><br/>");
            }
        }
    })
}