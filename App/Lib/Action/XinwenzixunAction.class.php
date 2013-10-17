<?php

/**

 * 

 * 新闻

 *

 * @package      	YIGECMS_CORP

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: ArticleAction.class.php v1.0 2012-01-01 06:59:03 

 */



class XinwenzixunAction extends GlobalAction

{

    public $dao;

    function _initialize()

    {

        parent::_initialize();

        $this->dao = D('Article');

        $this->assign('moduleTitle', '新闻资讯');

        $data['newsCategory'] = getCategory($this->globalCategory, 1,0);

		$catelist = $data['newsCategory'];

		foreach($catelist as $key=>$v)

		

		    { 

			if($catelist[$key]['html_url'] != '' && $this->sysConfig['jingtai'] == 1){

			$catelist[$key]['url'] = "/".$catelist[$key]['html_url'];

			}

			else

			{

			$catelist[$key]['url']=U(MODULE_NAME."/nlist/",array('category'=>$catelist[$key]['id'])); 	

			}

			 }

	

	

	    //当前位置

		   $murl="";

		

	    	if(file_exists("html/".MODULE_NAME."/index.html") && $this->sysConfig['jingtai']==1){

		       $murl="/html/".MODULE_NAME."/index.html";	

			}else{

			 $murl=	U(MODULE_NAME."/index");

		     }

		  

          $this->assign("catelist",$catelist);

		   $this->assign("cat_id",$_GET['category']);

		  $this->assign('murl',$murl);

		 

		

		

		

		

    }

    

    /**

     * 列表

     *

     */

    public function index()

	

    {    //is_html(MODULE_NAME,$this->sysConfig['jingtai']); 
        
		$biaozhi=$_GET['biaozhi'];
		$biaozhi=explode('/',$biaozhi);
		$biaozhi=$biaozhi[0];
		
       
		if($biaozhi){
        $category = M('Category')->where('biaozhi="'.$biaozhi.'"')->getField('id');
		
       // echo M('Category')->getLastSql();
        $category && $condition['category_id'] = array('eq', $category);
}

        $condition['a.status'] = array('eq', 0);

        $this->assign('category',$category);

        parent::getJoinList($condition, 'a.id DESC', $pages, C('DB_PREFIX').'article a', C('DB_PREFIX').'category b on a.category_id=b.id','a.*, b.biaozhi as biaozhi,b.title as cate');

    }

    

	

	 public function nlist()

	

    {  

	    $pages = 3;

        $category = intval($_GET['category']);

        $category && $condition['category_id'] = array('eq', $category);

        $condition['a.status'] = array('eq', 0);

        $this->assign('category',$category);

        parent::getJoinList($condition, 'a.id DESC', $pages, C('DB_PREFIX').'article a', C('DB_PREFIX').'category b on a.category_id=b.id','a.*, b.title as categoryName');

    }

	

	 public function htmllist()

	

    {  

	    $pages = 3;

        $category = intval($_GET['category']);

        $category && $condition['category_id'] = array('eq', $category);

        $condition['a.status'] = array('eq', 0);

        $this->assign('category',$category);

        parent::getJoinList($condition, 'a.id DESC', $pages, C('DB_PREFIX').'article a', C('DB_PREFIX').'category b on a.category_id=b.id','a.*, b.title as categoryName');

    }

    /**

     * 内容

     *

     */

    public function detail(){

        $titleId = intval($_GET['id']);

     
        parent::getJoinDetail(array("a.id={$titleId}", "id={$titleId}"), 'view_count', C('DB_PREFIX').'article a', C('DB_PREFIX').'category b on a.category_id=b.id','a.*, b.title as categoryName');

    }

	

	

	  public function hdetail(){

        $titleId = intval($_GET['item']);

        $commentCount = M('Comment')->where("title_id={$titleId} and module='Article'")->count();

        $this->assign('commentCount', $commentCount);

          parent::getJoinDetail(array("a.id={$titleId}", "id={$titleId}"), 'view_count', C('DB_PREFIX').'article a', C('DB_PREFIX').'category b on a.category_id=b.id','a.*, b.title as categoryName');

    

    }

	//静态点击率

	public function did(){

		

 $id=$_GET['item'];	

 $did=$this->dao->Field('view_count')->where('id='.$id)->limit(1)->find();

 $this->dao->where('id='.$id)->setInc('view_count',1);

 echo $did['view_count'];		  

		  

		}

	

	

}