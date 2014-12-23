<ul class="nav nav-pills">
	<li class='<?php echo Arr::get($subnav, "index" ); ?>'><?php echo Html::anchor('user/index','Index');?></li>
	<li class='<?php echo Arr::get($subnav, "login" ); ?>'><?php echo Html::anchor('user/login','Login');?></li>
	<li class='<?php echo Arr::get($subnav, "posts" ); ?>'><?php echo Html::anchor('user/posts','Posts');?></li>

</ul>
<p>Login</p>