<?php

/**
 * @var yii\web\View $this
 * @var common\models\DisasterType $model
 */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Disaster Type',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Disaster Types'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="disaster-type-create">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
