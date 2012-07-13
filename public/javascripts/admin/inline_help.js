fields = {
   product_available_on: "Укажите, начиная с какой даты товар станет<br />доступен в публичной части магазина.",
   product_permalink: "Часть URL, по которой данный товар<br />будет доступен (постоянная ссылка, SEO-атрибут).",
   product_prototype_id: "Заранее определенный набор свойств товара.<br />Позволяет существенно сэкономить время при<br />добавлении товаров с одинаковыми наборами свойств.<br />Прототипы задаются в меню \"Товары\"&nbsp;&ndash;&nbsp;\"Прототипы\"",
   product_price: "Дробная часть отделяется точкой.",
   product_shipping_category_id: "Набор способов доставки, применимых к данному товару.<br />Определяется в меню \"Конфигурация\"&nbsp;&ndash;<br />\"Способы доставки\" &ndash;&nbsp;\"Категории доставки\"",
   product_tax_category_id: "Набор налоговых ставок, применимых к данному товару.<br />Определяется в меню \"Конфигурация\"&nbsp;&ndash;<br />\"Налоговые ставки\" &ndash;&nbsp;\"Категории налогов\"",
   option_type_name: "Для внутреннего использования в административном интерфейсе.",
   option_type_presentation: "Для отображения в магазине.",
   property_name: "Для внутреннего использования в административном интерфейсе.",
   property_presentation: "Для отображения в магазине.",
   prototype_name: "Для внутреннего использования в административном интерфейсе.<br />Старайтесь, чтобы название прототипа отражало товар, к которому<br />он будет применяться.",
   product_group_name: "Для внутреннего использования в административном интерфейсе.",
   product_group_order_scope: "Порядок, в котором товары данной группы<br />будут отображаться в магазине.",
   preferences_site_name: "Отображается в title всех страниц, а также<br />в теме email-уведомлений пользователям и т.п.",
   preferences_default_seo_title: "Добавляется к названию магазина в<br />title главной и текстовых страниц.",
   adjustment_amount: "Чтобы сделать скидку, установите отрицательное значение.",
   zone_name: "Для внутреннего использования в административном интерфейсе.",
   zone_description: "Для отображения в магазине.",
   payment_method_name: "Для отображения в магазине.",
   payment_method_description: "Дополнительное описание, показывается покупателю<br />на шаге выбора способа оплаты.",
   payment_method_display_on: "Везде: способ будет доступен как покупателю, так и администратору.<br />В публичном интерфейсе: способ будет доступен только покупателю.<br />В административном интерфейсе: способ будет доступен только администратору при редактировании заказа вручную.",
   taxonomy_name: "Для отображения в магазине.",
   shipping_method_display_on: "Везде: способ будет доступен как покупателю, так и администратору.<br />В публичном интерфейсе: способ будет доступен только покупателю.<br />В административном интерфейсе: способ будет доступен только администратору при редактировании заказа вручную.",
   shipping_method_name: "Для отображения в магазине.",
   promotion_name: "Для отображения в магазине.",
   promotion_usage_limit: "Максимальное число использований данной акции.",
   page_slug: "Часть URL, по которой данная страница<br />будет доступна (постоянная ссылка, SEO-атрибут).",
   page_position: "Порядок отображения страницы относительно других страниц в одном меню.",
   page_layout: "Название макета для страниц с нестандартным макетом.",
   page_visible: "Если включено, страница будет видна покупателям.",
   page_foreign_link: "Если задано, данная ссылка меню будет вести на внешний сайт.<br />Например: http://www.example.com/index.php?from=synergy"
}

function register_help() {
  jQuery.each(fields, function(element_id, help_msg) {
    if (jQuery('#help_'+element_id).length == 0)
    {
      jQuery('label[for='+element_id+']').append("&nbsp;<span class='help' id='help_"+element_id+"'><img src='/images/admin/icons/help.png' alt='help' /></span>");
      jQuery('#help_'+element_id).simpletip({ position: 'right', offset: [-10, -230], content: help_msg});
    }
  });
}

$(document).ajaxSuccess(register_help);
$(document).ready(register_help);

