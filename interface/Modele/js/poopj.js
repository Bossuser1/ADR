/*
 * POOPJ : Programmation orientée objet par prototype avec jQuery
 * Auteur : Daniel Hagnoul (http://www.developpez.net/forums/u285162/danielhagnoul/)
 
 * $.dvjhClass Code v1.0.0 2010-08-16
 * 
 * Creative Commons License : Attribution-Share Alike 2.0 Belgium
 * (http://creativecommons.org/licenses/by-sa/2.0/be/legalcode.fr)
 *
 * Les méthodes et les attributs mis en évidence par
 * un underscore appartiennent à $.dvjhClass et se
 * retrouvent dans le prototype du nouvel objet.
 *
 * Attention, sans underscore, abstract et super sont des mots
 * réservés du langage JavaScript.
 * 
 * Un corpus est un ensemble de choses regroupées
 * dans une optique précise.
*/
(function($){
    try {
        var dvjhExceptions = {
            create1: "Erreur ! \nLes paramètres de la fonction ne sont pas conformes, on attend :\n create(classMere, Object)",
            create2: "Erreur ! \nLes paramètres de la fonction ne sont pas conformes, on attend :\n create(classMere, Object, Object)",
            create3: "Erreur ! \nLes paramètres de la fonction ne sont pas conformes, on attend :\n create(Object, Object)",
            create4: "Erreur ! \nLes paramètres de la fonction ne sont pas conformes, on attend :\n create(Object) pour une classe de base \net create(classMere, Object) pour un classe fille (héritage simple uniquement).",
            classMere1: "\n\nn'est pas une function-$.dvjhClass",
            corpus1: "\n\nn'est pas valide !"
        };
        
        $.dvjhClass = {
            _create: function(){
                var classMere = null;
                var corpus = null;
                var options = {
                    _abstract: false,
                    _auteur: "Auteur : Daniel Hagnoul (http://www.developpez.net/forums/u285162/danielhagnoul/)",
                    _copyright: "Creative Commons License : Attribution-Share Alike 2.0 Belgium (http://creativecommons.org/licenses/by-sa/2.0/be/legalcode.fr)",
                    _version: "$.dvjhClass, Daniel Hagnoul, v1.0.0 2010-08-16"
                }
                
                // si le premier argument est une fonction
                if ($.isFunction(arguments[0])){
                    classMere = arguments[0];
                    
                    // il doit y avoir un objet comme deuxième argument
                    if ($.isPlainObject(arguments[1])){
                        corpus = arguments[1];
                    } else {
                        throw(dvjhExceptions.create1);
                    }
                    
                    // il peut y avoir un objet comme troisième argument
                    if ($.isPlainObject(arguments[2])){
                        $.extend(options, arguments[2]);
                        
                        if (typeof options._abstract != "boolean"){
                            options._abstract = true;
                        }
                        
                    } else if (arguments[2]){
                        throw(dvjhExceptions.create2);
                    }
                } else if ($.isPlainObject(arguments[0])){
                    // le premier argument est un objet
                    corpus = arguments[0];
                    
                    // il peut y avoir un objet comme second argument
                    if ($.isPlainObject(arguments[1])){
                        $.extend(options, arguments[1]);
                        
                        if (typeof options._abstract != "boolean"){
                            options._abstract = true;
                        }
                        
                    } else if (arguments[1]){
                        throw(dvjhExceptions.create3);
                    }
                } else {
                    // le premier argument n'est pas un objet
                    throw(dvjhExceptions.create4);
                }
                
                if (!corpus._builder){
                    throw(corpus + dvjhExceptions.corpus1);
                }
                
                if (classMere && !classMere.prototype._builder){
                    throw(classMere + dvjhExceptions.classMere1);
                }
                
                // fonction à partir de laquelle le nouvel objet est instancié
                function build(){
                    try {
                        /*
                         * Dans le cas d'une classe abstraite
                         * ( _abstract == true) on choisit de retourner
                         * un objet vide (new Object) plutôt que de
                         * déclencher une exception, car dans ce cas
                         * l'opérateur new construit un objet invalide.
                         */
                        if (this._options._abstract){
                            return {};
                        }
                        
                        this._builder.apply(this, arguments);
                    }
                    catch(err){
                        alert(err);
                    }
                }
                
                if (classMere){
                    // incorporer classMere en premier
                    $.extend(build.prototype, classMere.prototype);
                    
                    // conserver un accès aux méthodes originales de classMere
                    build.prototype._super = {};
                    
                    for (var item in classMere.prototype){
                        if (item.slice(0,1) != "_"){
                            build.prototype._super[item] = classMere.prototype[item];
                        }
                    }
                }
                
                // incorporer l'objet $.dvjhClass et le corpus
                $.extend(build.prototype, this, corpus);
                
                // incorporer les options
                build.prototype._options = options;
                
                // retourne la fonction à partir de laquelle le nouvel objet est instancié
                return build;
            },
            _base: function(doNotTouchMe_YouIdiot, classMere, args){
                /*
                 * doNotTouchMe_YouIdiot est arguments.callee
                 *
                 * arguments.callee est l'équivalent de this pour une fonction anonyme
                 *
                 * il permet l'initialisation des classes mères par un appel récursif
                */
                if (!classMere.prototype._builder){
                    throw(classMere + dvjhExceptions.classMere1);
                }
                
                // initialisation de la classe mère
                classMere.prototype._builder.apply(this, args);
            },
            toString: function(){
                return this._options._version;
            }
        };
    }
    catch(err){
        alert(err);
    }
})(jQuery);
