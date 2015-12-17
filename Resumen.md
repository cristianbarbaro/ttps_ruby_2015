### Resumen

+ El primer tema que se ve es _Metodologías Ágiles_. Así van a pasar, sin pena ni gloria.

+ Otro tema que se trata es _GIT_. De nuevo, por ahora no me interesa mucho ver hasta dónde es capaz de llegar mi conocimiento sobre esta herramienta de versionado.


+ **Sobre el lenguaje:**
  + Dinámico.
  + Orientado a objetos.
  + Características funcionales.
  + Capacidad de metaprogramación.

  ```ruby

      NombreDeClaseOModulo

      CONSTANTE

      @nombre_de_atributo

      @@atributo_de_clase

      $variable_global

      nombre_de_metodo

      metodo_peligroso!

      metodo_que_pregunta?
  ```

+ **Strings literales:**
  + Recordemos que tenemos interpolación y que esta se da solo cuando contamos con comillas dobles. Hay varias formas de interpolar:
    + ``` "Interpolando: #{'Ja'*3}!" ```
    + También contamos con esta forma:

      ```ruby
        %q/Hola/  #Escribe un string de comillas simples.
        %q!Chau!  
        %Q{Interpolando: #{3+3}} #Genera un string de comillas dobles (por eso se puede interpolar).
      ```

    + También tenemos esta forma de hacer las cosas: ```"%05d" % 123   #=> "00123" ```. Esto recuerda un poco al ```printf```. Por ahora no nos quedemos con esta que, definitivamente, no es precisa.
  + Algo interesante sobre la concatenación, hay una manera que casi me hizo ir peor en el primer coloquio:

  + Usando el operando ```<<```:

    ```ruby
    a = "hello "
    a << "world"   #=> "hello world"
    a.concat(33)   #=> "hello world!"
    ```

  + Textos de más de una línea:

    ```
      str = <<EOS
        Este es un texto
        que se extiende
        en más de una línea
      EOS

    # Hacer algo con ese str.
    str.upcase

    ```

    + La función scan devuelve un arreglo con la cantidad de elementos que le envío como argumento. Puedo decirle que me devuelva un arreglo con las palabras que contiene ese string diciéndole: ```str.scan(/\w+/)```.

    + La función ```sub(str, arg)``` reemplaza todas las cadenas que coincida con _arg_ en _str_.


+ **Símbolos:**
  + Se garantiza que son únicos y no se necesita asignarles ningún valor.


+ **Arreglos:**
  + Veamos algunas maneras de crear arreglos:
    + La manera literal de hacerlo es: ```['Hola', 'Chau'] ```.
    + Podemos hacerlo también, sin interpolar: ```%w(Hola Chau #{2*2}) ```. Esto retorna tres strings donde no se hace el cálculo 2*2.
    + Podemos interpolar usando: ```%W(Hola Chau #{2*2})```. Esto va a retornar los dos strings y la evaluación de 2*2.
    + También podemos tener arrays de símbolos de la misma forma que obtuvimos strings y con su interpolación. Debe usarse ```%i``` sin interpolar y ```%I``` con interpolación.
    + Si usamos ```%s``` obtendremos un único símbolo con una frase.
    + Se pueden agregar elementos en un arreglo usando la función ```push()``` o usando el operando ```<<```.


+ **Hashes:**
  + Veamos su sintaxis, que varía en algún cambio de versión:

    ```ruby

      # Versión 1.8
      {
          :nombre     => 'Cristian',
          :apellido   => 'Barbaro'
      }
      # Versión > 1.8
      {
          nombre:     'Cristian',
          apellido:   'Barbaro'
      }

    ```

+ **Rangos:**
  + Tenemos varias formas de escribirlo:
    + Si deseamos que se incluyan todos los números que definen su longitud se usa dos puntos, si queremos un intervalo abierto en el extremo derecho, usamos tres puntos.

      ```ruby

        0..1
        0..10
        "a".."z"
        "a"..."z"

        #Como intervalo:
        (1..10) === 5   # => true
        (1..10) === 15   # => false
        (1..10) === 3.1  # => true

        ```

+ **Algo interesante:**
  + A un objeto le puedo enviar un mensaje mediante el método ```send()```. En otras palabras, puedo decirle a un string ```:upcase``` sin necesidad de hacerlo directamente: ```"Hola".send(:upcase)```.

  + Esto es interesante, es algo sobre el operando ```&```:

    ```ruby
    (1..10).select { |n| n.even? }

    # o lo que es igual:

    (1..10).select(& :even?)
    ```

    Lo que ocurre aquí es que ```&``` llama a ```to_proc``` y siempre debe recibir un símbolo para que funcione. Este mensaje lo recibe el objeto que es enviado como parámetro al bloque, en este caso queda implícito (es decir, se ejecuta para cada elemento de la iteración).

  + También tenemos casos en los que les enviamos un mensaje a un ```inject``` o un ```reduce```. Ruby nos da la posibilidad de hacer las cosas con poco código y de forma bonita:

    ```ruby
    #Sumatoria:

    (1..100).reduce { |sum,n| sum + n }

    # o lo que es igual:

    (1..100).reduce(:+)
    ```

  + Hay un ejercicio donde se me da un arreglo y me piden que lo ordene llamando a una función que se encarga de ello. Lo que sucede es que al enviárselo a ella debo hacerlo haciendo el arreglo splat antes de mandarlo o se me retornará un arreglo con un arreglo ordenado dentro.


+ **Lambdas:**
  + Veamos un código:

    ```ruby
      uno  = lambda { |n| n * 2 }
      dos  = ->(n, m){ n * 2 + m }
      tres = ->(n, m=0){ n * 2 + m}

      # Entonces
      uno.call 2          # => 4
      dos.call 2,3        # => 7
      tres.call 2         # => 4
    ```

  + Son funciones anónimas. Arriba vimos diferentes maneras de definirlas.


+ **Monkey patching:**
  + Es cuando se modifica una clase en tiempo de ejecución.
  + Se agregan nuevos métodos a una clase o se cambia su comportamiento.


+ **Módulos:**
  + ¿Qué diferencias hay entre ```include``` y `extend`? `include` hace que los métodos del módulo estén disponibles en la instancia de una clase mientras `extend` hace que esos métodos estén disponibles para una clase (en otras palabras, se hacen métodos de clase).

  + Supongamos el caso en el que yo quiero agregar métodos de instancia y de clase a mi clase, hago un `include` para tener los de clase, pero en el módulo tendré otro módulo que contendrá los métodos de clase y los incluiré con la función `self.included`. Veamos un ejemplo de la práctica:

    ```ruby
    module Countable

      #Incluyo los métodos de clase a mi módulo cuando se llama al include que incluirá este módulo.
      #El included se ejecuta siempre que se hace include y lleva a cabo altas tareas de locuras.
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods

        def count_invocations_of(*syms)

          define_method(:hash) do
            @hash ||= Hash.new 0 #
          end

          syms.each do |sym|

            sym_old = ("#{sym}"+"_old")

            # hash[sym] = 0

            alias_method(sym_old ,sym)

            define_method(sym) do |*args|
              #Esto inicializa el hash en el caso que no lo esté.
              @hash[sym] += 1
              send sym_old, *args
            end

          end
        end

      end

      #Métodos de instancia
      def invoked?(sym)
        self.invoked(sym) > 0
      end

      def invoked(sym)
        hash[sym]
      end

    end
    ```

    Debo agregar explícitamente el módulo o sino no será extendido en la clase en la que realice el `include`. Algo similar ocurre si quiero incluir el módulo en vez de extenderlo.
    Algo que ocurre al hacer esto es que liberamos al usuario de hacer un `extend` explícito (en este problema) de los métodos de clase. Por lo tanto, aquí estamos logrando un cierto encapsulamiento. El usuario estará feliz al tener que hacer algo menos.

    + Debemos recordar que `self.included(base)` se ejecuta cuando se realiza un `include` del módulo que lo invoca. Acá tenemos la posiblidad de inicializar (por decirlo de alguna manera) el estado interno del módulo.

    + **Un poco sobre argumentos:**
      + Los argumentos variables se anotan con un `*` antes del nombre del argumento, luego de los parámetros normales logramos este efecto. Se le denomina _splatting an argument_. (Desde la versión 1.9 se puede definir el splatting en cualquier lado, siempre y cuando no tenga más de uno.)

        ```ruby
        def varargs(arg1, *rest)
          "arg1=#{arg1}. rest=#{rest.inspect}"
        end
        ```

      + Es común que se usen los splat para pasar argumentos a una superclase usando `super`. Si no se especifican parámetros a `super`, entonces se invoca el método del padre con todos los argumentos que se hayan recibido.

    + Algo sobre `return`: si se retornan varios valores, estos son devueltos en un arreglo.


+ **Clases y objetos:**
  + Sobre el método `initialize`: cada vez que invocamos `new`, Ruby aloca espacio de memoria para alojar un objeto no inicializado y luego llama al método `initialize` pasándole cada parámetro que recibiera `new` si correspondiese. (En otras palabras, `initialize` nos permite configurar el estado inicial de nuestros objetos.)

  + Las variables de instancia comienzan con el símbolo _@_.
  + Sobre los atributos y sus accesos (_accessors_):
    + `attr_reader` genera accessors para leer el valor de un atributo (del mismo nombre que el accesor). Este recibe como argumento el nombre de los accessors como símbolo.
    + También tenemos `attr_writer` que genera accessors de solo escritura aunque el más común es
    + `attr_accesor` que provee acceso tanto a escritura como lectura.
    + Otra forma de escribir atributos de escritura es definiendo el método `=` (si no utilizamos el accesor definido en la línea anterior):

      ```ruby
      #Ejemplo tomado de la teoría.
      class BookInStock
          attr_reader :isbn, :price

          def initialize(isbn, price)
              @isbn = isbn
              @price = Float(price)
          end

          def price=(new_price)
              @price = new_price
          end

      end
      ```

      Esto último no es necesario hacerse si usamos el `attr_accesor`. La vida se hace sencilla a veces.


+ **Colecciones, bloques e iteradores:**
  + En Ruby hay dos clases de colecciones: `Hash` y `Array`. (Nunca me había puesto a pensar en esto, es verdad.)
  + Podemos pensar que los bloques son métodos anónimos que les enviamos a los iteradores.
    + Hay algo a tener en cuenta sobre las variables dentro de los bloques: si hay una variable que se llama igual dentro del bloque como fuera del mismo, entonces esta será considerada la misma; sin embargo, si hay una variable que solo es usada dentro del bloque, entonces esta será local al mismo.

      ```ruby
      square = "some shape"
      sum = 0
      [1, 2, 3, 4].each do |value; square|
          square = value * value # different variable
          sum += square
      end
      puts sum
      puts square
      ```

      Lo que se trata de hacer en este código es acceder a una variable que es usada dentro del bloque. Para poder hacerlo, debemos agregarla seguido del argumento (o argumentos del bloque) separados por un `;`, como se ve en el código. Luego de ejecutar esas líneas, vemos que `shape` mantiene el valor que tenía antes de que comenzase la iteración. La idea en este caso es mantener el valor que tenía esta variable antes que se manipulara dentro del bloque. (C'est la vie. Esto no es tan fácil como pensaba.)


+ **Enumeradores:**

  + La clase `Enumerator` se obtiene de una colección luego de enviarles el mensaje `to_enum` o `enum_for`. También puede obtenerse un enumerador si le mandamos el mensaje `each` (esto sucede con cada iterador que es invocado sin bloque: el resultado es un iterador). Se recorre cada uno de sus elementos con el mensaje `next`.

  + Hablemos un poco de los _lazy enumerators_: estos se generan bajo demanda. Reciben un bloque que contiene la lógica sobre cómo se debe retornar cada elemento. Dentro del mismo se ejecuta el bloque y queda a la espera de que le digamos que nos dé el siguiente elemento. Así podemos generar **secuencias infinitas**.

    ```ruby
    fibonacci = Enumerator.new do |caller|
        i1, i2 = 1, 1
        loop do
            caller.yield i1
            i1, i2 = i2, i1+i2
        end
    end

    6.times { puts fibonacci.next }
    ```

    Aquí podemos ver el `caller` al cual le enviamos el mensaje `yield` con el parámetro. Cabe destacar que esto se puede poner tan complicado como se desee. Aun así, es un tema muy interesante.


+ **Herencia:**
  + La manera de declarar herencia es usando el operador `<`, con él declaramos que una clase es subclase de otra.


+ **Mixins:**
  + Se debe incluir el módulo en la clase que lo va a usar. En general podemos usarlos para armar jerarquías de cosas que en realidad no son familia. Es como pensar en extender una persona a partir de una clase que se llame _Almacenable_ o algo similar. La idea es mezclar lo mejor de ambas. Algo así como una chanchada linda.
  + Un método no puede tener instancias porque no son clases, entonces
  + cuando incluimos un módulo a una definición de clase sucede que
  + los métodos de instancia definidos en el módulo son incluidos como métodos de instancia de la clase; es como decir que se mezclan (**mixed in**). Por lo tanto,
  + los módulos _mixed in_ se comportan como superclases.
  + Veamos más detalladamente el uso de `include`:
    + El uso del `include` agrega en Ruby una referencia al módulo que agregará nuevos métodos a nuestra clase.
    + Si varias clases incluyen al mismo módulo, entonces todas tendrán referencias al mismo.
    + Si modificamos el módulo durante la ejecución del programa, todas las clases que incluyan al módulo tomarán los cambios automáticamente.
    + La manera en la que se resuelven los conflictos de nombres es:
      + Primero se busca si la clase del objeto lo implementa
      + Luego en los mixins incluidos por la clase. Si tiene varios módulos, el último será el considerado
      + Luego en la superclase

  + Finalmente, los _mixins_ se vuelven potentes cuando interactúan con una clase que los utiliza.


+ **Excepciones, catch y throw:**
  + Clase `Exception`: En Ruby se define una jerarquía de excepciones que son subclases de `Exception`. Se supone que con esta jerarquía se hace sencillo el manejo de excepciones.
  + Toda excepción tiene asociado un mensaje y una traza de ejecución.
  + Cuando sucede una excepción  se ubica una referencia al objeto con la excepción asociada en la variable global `$!`.
  + Para entender un poco sobre la jerarquía de excepciones, vamos a ver el [ej01tp03](https://github.com/cristianbarbaro/ttps_ruby_2015/blob/master/tp03/excepciones/ej01tp03.md) de la práctica de Ruby.

  + `rescue`:
    + Se decide cuál utilizar como si se tratase de sentencias `case`. Para comparar, lo hace con la clase del tipo de excepción que deseamos agregarle. Si se omite este parámetro, entonces va a comparar por defecto con `StandardError`.
  + `ensure`:
    + Cuando necesitamos asegurar la ejecución de cierto código al finalizar un método, contamos con esta sentencia. Esta se ejecuta independientemente de si hubo o no error.
  + `else`:
    + Esta sentencia aplica cuando ninguno de los rescue manejan la excepción. Es decir, cuando no hubo error.
  + `retry`:
    + Se usa para corregir luego de ocurrir una excepción (hay que tener cuidado de no caer en bucles infinitos).
  + `raise`:
    + Lanza explíticamente una excepción.
    + `RuntimeError` es la excepción que se lanza por defecto si no se le indica el tipo.
  + `catch` y `throw`: este es un concepto que no termino de entender. Derivo al [ej02tp03](https://github.com/cristianbarbaro/ttps_ruby_2015/blob/master/tp03/excepciones/ej02tp03.md) (se explica brevemente la diferencia entre `throw` y `raise`). Espero que aclare un poco.
  + Es interesante leer los ejercicios resueltos de esta [parte del trabajo práctico](https://github.com/cristianbarbaro/ttps_ruby_2015/tree/master/tp03/excepciones) ya que se explica un poco de todo y hay problemas resueltos con código.


+ **Importante:**
  + El modificador de visibilidad `private`, cuando se invoca un método privado no se debe usar la palabra clave `self` ya que los privados no son accesibles por nadie ni siquiera de la familia. Si son privados, es evidente que ese mismo objeto será el que quiere accederlo. :)

  + Recomiendo leer el [ej08tp02](https://github.com/cristianbarbaro/ttps_ruby_2015/blob/master/tp02/clases%20y%20modulos/ej08tp02.rb) de clases y módulos. Allí pasan cosas raras y está bueno para entender un poco cómo funciona la **herencia** en casos particulares.
