<?php

/**

 * 

 * 留言

 *

 * @package      	YIGECMS_CORP

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: FeedbackAction.class.php v1.0 2012-01-01 06:59:03 

 */



class FeedbackAction extends GlobalAction

{

    public $dao;

    function _initialize()

    {

        parent::_initialize();

        $this->dao = D('Feedback');

        $this->assign('moduleTitle', '留言反馈');

        $this->assign($data);

		$data['newsCategory'] = getCategory1($this->globalCategory, 1,0);

		$catelist = $data['newsCategory'];

		foreach($catelist as $key=>$v)

		

		    { 

			 $catelist[$key]['url'] = $v['title']."hhh";

			 }

		//echo "<pre>";

		//print_r($catelist);

		

        $this->assign("catelist",$catelist);

    }



    /**

     * 列表

     *

     */

    public function index()

    {

        parent::getList('status=0', 0, 8);

    }



    /**

     * 提交留言

     *

     */

    public function doInsert()

    {

        $data['title'] = dadds(trim($_POST['title']));

        $data['username'] = dadds(trim($_POST['username']));

        $data['email'] = dadds(trim($_POST['email']));

        $data['content'] = trim($_POST['content']);

        $data['ip'] = get_client_ip();

        $data['create_time'] = time();

        $verifyCode = intval(trim($_POST['verifyCode']));

        empty($verifyCode) && parent::_message('error', '验证码必须填写');

        if(md5($verifyCode) != Session::get('verify'))

        {

            parent::_message('error', '验证码错误');

        }

        if($daoCreate = $this->dao->create())

        {

            $this->dao->status = $this->sysConfig['comment_verify'] == 1 ? 1 : 0 ;

            $daoAdd = $this->dao->add();

            if(false !== $daoAdd)

            {

                parent::_message('success', '留言成功');

            }else

            {

                parent::_message('error', '留言失败，请检查必填项');

            }

        }else

        {

            parent::_message('error', $this->dao->getError());

        }

    }

}