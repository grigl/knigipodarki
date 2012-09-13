# encoding: utf-8
namespace :knigipodarki do
  task :install => :environment do
    populate_info_page
  end
end

def populate_info_page
  info_page_body = '<!-- .about -->
 <section class="about" id="about">

 <h1>О нас</h1>

 <!-- item -->
 <article>
 <img  src="/images/about_shop.png" alt="">
 <h2>Магазин</h2>
 <p>
 КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.
 </p>
 </article>
 <!-- /item -->

 <!-- item -->
 <article>
 <img  src="/images/about_contacts.png" alt="">
 <h2>Контакты</h2>
 <p>
 Санкт-Петербург, Лиговский пр., 74 (войти во двор, 1-ый этаж, слева от входа в Этажи) посмотреть на карте.
 </p>
 <p>
 +7(812)715 33 07<br>
 +7(953)140 80 87<br><br>
 <a href="">info@knigibodarki.ru</a>
 </p>
 </article>
 <!-- /item -->

 </section>
 <!-- /.about -->

 <!-- .about -->
 <section class="about" id="payment">

 <h1>Оплата</h1>

 <!-- item -->
 <article>
 <img  src="/images/about_robo.png" alt="">
 <h2>Робокасса</h2>
 <p>
 КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.
 </p>
 </article>
 <!-- /item -->

 <!-- item -->
 <article>
 <img  src="/images/about_cash.png" alt="">
 <h2>Наличными курьеру</h2>
 <p>
 КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.
 </p>
 </article>
 <!-- /item -->

 </section>
 <!-- /.about -->

 <!-- .about -->
 <section class="about" id="delivery">

 <h1>Доставка</h1>

 <!-- item -->
 <article>
 <img  src="/images/about_delivery.png" alt="">
 <h2>Курьерская</h2>
 <p>
 КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.
 </p>
 </article>
 <!-- /item -->

 <!-- item -->
 <article>
 <img  src="/images/about_mail.png" alt="">
 <h2>EMS Почта России</h2>
 <p>
 КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.
 </p>
 <img  src="/images/about_postamat.png" alt="">
 <h2>Постамат</h2>
 <p>
 КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.
 </p>
 <img  src="/images/about_self.png" alt="">
 <h2>Самовывоз</h2>
 <p>
 КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.
 </p>
 </article>
 <!-- /item -->

 </section>
 <!-- /.about -->

 <!-- .about -->
 <section class="about" id="contacts">

 <h1>Сотрудничество</h1>

 <!-- item -->
 <article>
 <img  src="/images/about_distrib.png" alt="">
 <h2>Поставщикам</h2>
 <p>
 КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.
 </p>
 <img  src="/images/about_opt.png" alt="">
 <h2>Опт</h2>
 <p>
 КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.
 </p>
 </article>
 <!-- /item -->

 <!-- item -->
 <article>
 <img  src="/images/about_req.png" alt="">
 <h2>Реквизиты</h2>
 <p>
 КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.
 </p>
 </article>
 <!-- /item -->

 </section>
 <!-- /.about -->'
  Page.create(slug: 'information', title: 'information', body: info_page_body)
end