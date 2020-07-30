<div class="container">
	<div class="row">
      <p>Добрый день, <?php echo $data['session']['user']; ?></p>
	</div>
   <div class="row py-3">
	   <?php if (isset($data['session']['user']) && $data['session']['user'] === 'admin') { $is_admin = true; ?>
          <div class="col-2">
             <a class="btn btn-primary" href="<?php echo $data['server']['HTTP_ORIGIN'] . '/login/logout'; ?>" >Выйти</a>
          </div>
	   <?php }  ?>
   </div>
</div>
