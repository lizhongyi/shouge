<?php

/**

 * 

 * 搜索

 *

 * @package      	YIGECMS_CORP

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: ArticleAction.class.php v1.0 2012-01-01 06:59:03 

 */



class SearchAction extends GlobalAction

{

    public $dao;

    function _initialize()

    {

        parent::_initialize();

        $this->assign('moduleTitle', '搜索中心');

        $this->assign($data);

		$this->dao = M('Page');

		//获取page标题

		$row=$this->dao->where('category_id=95')->order("id asc")->select(); 

        $this->assign('row',$row);

    }



    /**

     * 列表

     *

     */

    public function getList()

    {

        $keyword = dadds($_GET['keyword']);

        $module = dadds(trim($_GET['module']));

        $moduleArr = array('Article', 'Product', 'Download', 'Job');

        //!in_array($module, $moduleArr) && parent::_message('error', '非法模块', U('Index/index'));

        $this->dao = M($module);

		

        $this->assign('module', $module);

        parent::getList("title like '%{$keyword}%'");

    }



    /**

     * 提交评论

     *

     */

    public function doInsert()

    {

        $data['username'] = dadds(trim($_POST['username']));

        $data['email'] = dadds(trim($_POST['email']));

        $data['content'] = trim($_POST['content']);

        $data['module'] = trim($_POST['module']);

        $data['title_id'] = intval($_POST['title_id']);

        $data['ip'] = get_client_ip();

        $data['create_time'] = time();

        $verifyCode = intval(trim($_POST['verifyCode']));

        if(empty($data['username']) || empty($data['content'])){

            echo 'emptyInfo';

            exit();

        }elseif(md5($verifyCode) != Session::get('verify'))

        {

            echo 'errorVerifyCode';

            exit();

        }

        if($daoCreate = $this->dao->create($data))

        {

            $daoAdd = $this->dao->add();

            if(false !== $daoAdd)

            {

                echo 'success';

                exit();

            }else

            {

                echo '评论录入错误';

                exit();

            }

        }else

        {

            echo $this->dao->getError();

            exit();

        }

    }

}