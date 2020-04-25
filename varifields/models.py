from django.db import models
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType

class VariFieldSpecChoice(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, help_text='This is for limiting the choices in the content_type field of variable field specifications.  It is unlikely that you should have to change this often')

    def __str__(self):
        return'{} | {} '.format( self.content_type.app_label, self.content_type.model )

class VariFieldObject(models.Model): #k418
    object_id = models.PositiveIntegerField(null=True, blank=True) #k418

class VariFieldSpec(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, help_text='The type of object(the model) to which this field will apply.  Note: The choices are limted by Vari Field Spec Choices')
    vari_field_objects = models.ManyToManyField(VariFieldObject, blank=True, help_text='The objects to which this field will apply')  #k418
    name = models.CharField('name', max_length=30, help_text='The name of the field')
    choices = models.CharField('choices', max_length=30, help_text="Optionally, a comma-separated list of choices", blank=True)
    on_list = models.BooleanField('on list', default=False, help_text="If this should appear on a list -- Note: This field's operation depends on the programming of the app that uses it.  It has no effect unless used by the app")
    on_filter = models.BooleanField('on filter', default=False, help_text="If this should appear as an option for filtering -- Note: This field's operation depends on the programming of the app that uses it.  It has no effect unless used by the app")
    spec_help_text = models.CharField('help_text', max_length=255, help_text='The help text to be displayed', blank=True)

    class Meta:
        ordering = ['name']
        verbose_name = 'Variable Field'

    def __str__(self):
        return self.name

class VariFieldValue(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    spec = models.ForeignKey( VariFieldSpec, verbose_name='spec', on_delete=models.CASCADE, help_text='The spec for this additional info', related_name='value', )
    content = models.CharField( 'content', max_length=255, help_text='The value of the additional info', blank=True )

    def __str__(self):
        return self.spec.name + ": " + self.content

    class Meta:
        ordering = ['spec']
        verbose_name = 'Value for a variable field'

# vim ai et sts=4 sw=4 ts=4
