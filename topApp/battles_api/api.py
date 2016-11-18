# battles_api/api.py
from tastypie.authorization import Authorization
from tastypie.serializers import Serializer
from tastypie.resources import ModelResource
from .models import Battles
from tastypie.constants import ALL


class BattlesResource(ModelResource):
    class Meta:
        queryset = Battles.objects.all()
        resource_name = 'search'
        include_resource_uri = False
        filtering = {
            'name': ['icontains'],
            'location': ['icontains'],
            'battle_number': ALL
        }
        allowed_methods = ['get', 'post']
        # serializer = Serializer()
        always_return_data = True
        authorization = Authorization()

    def alter_list_data_to_serialize(self, request, data_dict):
        if isinstance(data_dict, dict):
            if 'meta' in data_dict:
                # Get rid of the "meta".
                del(data_dict['meta'])
        return data_dict

    # def dehydrate(self, bundle):
    #     bundle.data['custom_field'] = "Whatever you want"
    #     return bundle


class BattlePlaces(ModelResource):
    class Meta:
        queryset = Battles.objects.all()
        resource_name = 'list'
        limit = 40
        include_resource_uri = False
        fields = ['region', 'location']
        filtering = {
            'region': ['icontains'],
            'location': ['icontains']
        }
        allowed_methods = ['get', 'post']
        authorization = Authorization()

    def alter_list_data_to_serialize(self, request, data_dict):
        if isinstance(data_dict, dict):
            if 'meta' in data_dict:
                # Get rid of the "meta".
                del(data_dict['meta'])
        return data_dict


class BattleCount(ModelResource):
    class Meta:
        queryset = Battles.objects.all()
        resource_name = 'count'
        allowed_methods = ['get']
        include = ["total_count"]
        authorization = Authorization()

    def alter_list_data_to_serialize(self, request, data_dict):
        if isinstance(data_dict, dict):
            if 'objects' in data_dict:
                # modify the objects to get the total count of table entries
                data_dict['objects'] = [{'total_count':
                                        data_dict['meta']['total_count']}]
            if 'meta' in data_dict:
                # Get rid of the meta.
                del(data_dict['meta'])
        return data_dict
