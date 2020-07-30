<div class="container">

   <div class="row py-3">
      <?php if (isset($data['session']['user']) && $data['session']['user'] === 'admin') { $is_admin = true; ?>
         <div class="col-2">
            <a class="btn btn-primary" href="<?php echo $data['server']['HTTP_ORIGIN'] . '/login/logout'; ?>" >Выйти</a>
         </div>
      <?php } else { $is_admin = false; ?>
         <div class="col-2">
            <a class="btn btn-primary" href="<?php echo $data['server']['HTTP_ORIGIN'] . 'login'; ?>" >Авторизоваться</a>
         </div>
      <?php } ?>
   </div>

   <div class="row">
      <div class="col-12 text-center">
         <h1 class="py-3">Авторизуйтесь!</h1>
      </div>
      <?php if (isset($data['error'])) { ?>
         <div class="alert alert-danger" role="alert">
            <?php echo $data['error']; ?>
         </div>
      <?php } ?>
	   <?php if (isset($data['success'])) { ?>
          <div class="alert alert-success" role="alert">
			  <?php echo $data['success']; ?>
          </div>
	   <?php } ?>
   </div>
</div>
