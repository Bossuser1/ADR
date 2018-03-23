try {
    /*
     * On construit un système type MVC.
     * M pour les objets du modèle.
     * V pour l'objet responsable de l'affichage des résultats.
     * C pour l'objet qui contrôle le programme.
     *
     * Table est la fonction classe V.
     *
     * L'objet instancié affichera la table à la demande, elle
     * contiendra les informations qui lui auront été communiquées
     * par l'objet C.
     */
    var Table = $.dvjhClass._create({
        _builder: function(){
            this.eventName = "tableEvent.Table";
            this.th = null;
            this.trs = [];
            var self = this; // bonne pratique car jQuery peut modifier this
            
            $(this).bind(self.eventName, self.tableEventHandler);
        },
        tableEventHandler: function(event){
            if (event.dvjh && event.dvjh.length == 1){
                if (this.th == null) {
                    this.th = event.dvjh.p1Name;
                }
                
                this.trs.push(event.dvjh.p1Data);
            }
            
            return false;
        },
        print: function(id){
            // suppprime une éventuelle table précédente
            $("#"+id).find(".tablesorter").remove();
            
            if (this.th != null && this.trs[0] != null){
                var self = this;
                var t0 = this.trs[0][3];
                var tableID = "vue" + t0;
                var deltaT = [];
                var n = this.trs.length;
                
                deltaT.push(0);
                
                for(var i = 1; i < n; i++){
                    deltaT.push(this.trs[i][3] - t0);
                }
            
                var tdlength = this.th.length;
                var trlength = this.trs.length;
                
                var array = ["<table id='" + tableID + "' class='dvjhTable'>"];
                
                var arrayHead = ["<thead><tr>"];
                    
                    for(var i = 0; i < tdlength; i++) {
                        arrayHead.push("<th>" + self.th[i] + "</th>");
                    }
                    
                arrayHead.push("<th>Delta T ms</th></tr></thead>");
                
                var arrayFoot = ["<tfoot><tr>"];
                    
                    for(var i = 0; i < tdlength; i++) {
                        arrayFoot.push("<th>" + self.th[i] + "</th>");
                    }
                
                arrayFoot.push("<th>Delta T ms</th></tr></tfoot>");
                
                array.push(arrayHead.join(''), arrayFoot.join(''),"<tbody>");
                    
                    for(var j = 0; j < trlength; j++) {
                        array.push("<tr>");
                        
                        for(var i = 0; i < tdlength; i++) {
                            array.push("<td>" + self.trs[j][i] + "</td>");
                        }
                        
                        array.push("<td>" + deltaT[j] + "</td></tr>");
                    }
                
                array.push("</tbody></table>");
                
                $("#"+id).append(array.join(''));
                
                $("#"+tableID).tablesorter({
                    sortList: [[3,0]],
                    widgetZebra: {css: ["even", this.tableOddClass]},
                    widgets: ['zebra'],
                    headers: {
                        4:{sorter: false}
                    }
                });
            } else {
                $("#"+id).html("<p>Il n'y a aucune information à afficher !</p>");
            }
        },
        toString: function(){
            return "Table : ";
        }
    });
    
    /*
     * Pair est une fonction classe M.
     *
     * L'objet instancié communiquera à l'objet C
     * le résultat de son calcul.
     */
    var Pair = $.dvjhClass._create({
        number: 0,
        _builder: function(number){
            this.number = number || this.number;
        },
        add: function(obj){
            this.number++;
            
            if ((this.number % 2 == 0) && (obj.eventName)){	
                var objEvent = new $.Event(obj.eventName);
                
                /*
                 * On adopte la convention suivante :
                 * event.dvjh.length donne le nombre de params : p1, p2, etc
                 * event.dvjh.p1Name donne le(s) libellé(s) du param p1
                 * event.dvjh.p1Data contient la/les donnée(s) du param p1.
                 */
                objEvent.dvjh = {
                    length: 1,
                    p1Name: "Pair",
                    p1Data: this.number
                };
                
                $(obj).trigger(objEvent);
            }
        },
        toString: function(){
            return "Pair : ";
        }
    });
    
    /*
     * Impair est une fonction classe M.
     *
     * L'objet instancié communiquera à l'objet C
     * le résultat de son calcul.
     */
    var Impair = $.dvjhClass._create({
        number: 0,
        _builder: function(number){
            this.number = number || this.number;
        },
        add:function(obj){
            this.number++;
            
            if ((this.number % 2 != 0) && (obj.eventName)){
                var objEvent = new $.Event(obj.eventName);
                
                objEvent.dvjh = {
                    length: 1,
                    p1Name: "Impair",
                    p1Data: this.number
                };
                
                $(obj).trigger(objEvent);
            }
        },
        toString: function(){
            return "Impair : ";
        }
    });
    
    /*
     * Total est la fonction classe C.
     *
     * L'objet instancié jouera le rôle d'initiateur et de contrôleur
     * du programme. Il crée une instance des objets M et de l'objet V.
     *
     * Il questionne les objets M et stockent leurs
     * résultats dans l'objet V. Lorsque le temps est venu
     * il demande à l'objet V d'afficher les résultats.
     */
    var Total = $.dvjhClass._create({
        _builder: function(milliseconds, divID){
            this.eventName = "totalEvent.Total";
            this.number = 0;
            this.source = "";
            this.total = 0;
            this.timeStamp = 0;
            this.output = new Table();
            this.pair = new Pair();
            this.impair = new Impair();
            this.milliseconds = milliseconds || 1000;
            var self = this;
            
            $(this).bind(self.eventName, self.totalEventHandler);
            
            var pairInterval  = window.setInterval(function(){
                self.pair.add(self);
            }, 30);
            
            var impairInterval = window.setInterval(function(){
                self.impair.add(self);
            }, 40);
            
            window.setTimeout(function(){
                window.clearInterval(pairInterval);
                window.clearInterval(impairInterval);
                self.output.print(divID);
            }, this.milliseconds);
        },
        totalEventHandler: function(event){
            if (event.dvjh && event.dvjh.length == 1){
                this.number = event.dvjh.p1Data;
                this.source = event.dvjh.p1Name;
                this.total += this.number;
                this.timeStamp = event.timeStamp;
                
                if (this.output){
                    var self = this;
                    
                    var outputEvent = new $.Event(self.output.eventName);
                    
                    outputEvent.dvjh = {
                        length: 1,
                        p1Name: ["Total", "Nombre", "Source", "TimeStamp ms"],
                        p1Data: [this.total, this.number, this.source, this.timeStamp]
                    };
                    
                    $(this.output).trigger(outputEvent);
                }
            }
            
            return false;
        },
        toString: function(){
            return "Total : ";
        }
    });
}
catch(err){
    alert(err);
}
