<?php

/**

 * 

 * 招聘

 *

 * @package      	YIGECMS_CORP

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: ArticleAction.class.php v1.0 2012-01-01 06:59:03 

 */



class JobAction extends GlobalAction

{

    public $dao, $resumeDao;

    function _initialize()

    {

        parent::_initialize();

        $this->dao = M('Job');

        $this->assign('moduleTitle', '人才招聘');

        $this->resumeDao = D('Resume', 'Admin');

		$data['newsCategory'] = getCategory1($this->globalCategory, 1,0);

		$catelist = $data['newsCategory'];

		foreach($catelist as $key=>$v)

		

		    { 

			 $catelist[$key]['url'] = $v['title']."hhh";

			 }

		//echo "<pre>";

		//print_r($catelist);

		

        $this->assign("catelist",$catelist);

		//print_r($_GET);

    }

    

    /**

     * 列表

     *

     */

    public function index()

    {

        parent::getList('status=0');

    }

    

    /**

     * 内容

     *

     */

    public function detail(){

        $titleId = intval($_GET['item']);

        parent::getDetail("id={$titleId}", 'view_count');

    }



    /**

     * 提交应聘

     *

     */

    public function doResume()

    {

        $verifyCode = intval(trim($_POST['verifyCode']));

        empty($verifyCode) && parent::_message('error', '验证码必须填写');

        if(md5($verifyCode) != Session::get('verify'))

        {

            parent::_message('error', '验证码错误');

        }

        if($daoCreate = $this->resumeDao->create())

        {

            $uploadFile = upload($this->getActionName(),1,0,0);

            if ($uploadFile)

            {

                $this->resumeDao->attach_file = formatAttachPath($uploadFile[0]['savepath']) . $uploadFile[0]['savename'];

            }

            $daoAdd = $this->resumeDao->add();

            if(false !== $daoAdd)

            {

                parent::_message('success', '应聘资料提交成功，等待管理员处理');

            }else

            {

                parent::_message('error', '应聘资料提交失败，请检查必填项');

            }

        }else

        {

            parent::_message('error', $this->resumeDao->getError());

        }

    }

}