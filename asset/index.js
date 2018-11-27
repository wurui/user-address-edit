define(['oxjs','./distpicker'],function(OXJS,DistPicker){
  return {
    init:function($mod){
    	DistPicker.init({
    		provinceEl:$('select[name="province"]',$mod)[0],
    		cityEl:$('select[name="city"]',$mod)[0],
    		districtEl:$('select[name="district"]',$mod)[0]
    	});
    	var onEditComplete=function(){
    		history.back();
    	};
    	//[{"name":"user-address","attr":{"ADAPTERID":"35bfd08ce4b4b41719c2700a4","SELECTOR":"_id"},"body":{"n":1,"nModified":1,"ok":1}}]
    	var f=$('form',$mod).on('submit',function(e){
    		var json=OXJS.formToJSON(this);
    		//console.log(json);
    		var is_default=!!json.is_default;
    		var selected_id=json.selected_id;

    		delete json.is_default;
    		delete json.selected_id;

    		var callback=function(r){
    			if(is_default){
    				var new_id=json._id || r && r[0] && r[0].data  && r[0].data._id;
    				if(selected_id){
		    			$mod.OXPut({
		    				'user-address':{
		    					type:'user-address',
		    					selected:new_id,
		    					$updater:'default'
		    				}, 		
			    		},onEditComplete);
		    		}else{
		    			$mod.OXPost({
		    				'user-select':{
		    					type:'user-address',
		    					selected:new_id,
		    					$inserter:'default'
		    				}, 		
			    		},onEditComplete);
		    		}


    			}else{
    				onEditComplete()
    			}
    			

    		};
    		
    		if(json._id){
    			json.$updater='default';
    			$mod.OXPut({
    				'user-address':json,	
	    		},callback);
    		}else{
    			json.$inserter='default';
    			$mod.OXPost({
    				'user-address':json, 		
	    		},callback);
    		}

    		
    		
    		return false;
    	})[0];
    	$('.J_del',$mod).on('click',function(e){
    		var _id=f._id.value;

    		$mod.OXDelete({
    			'user-address':{
    				_id:_id,
    				$deleter:'default'
    			},
    		},onEditComplete);
    	})
    }
  }
})
