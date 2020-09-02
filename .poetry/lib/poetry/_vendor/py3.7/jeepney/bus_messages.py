"""Messages for talking to the DBus daemon itself

Generated by jeepney.bindgen and modified by hand.
"""
from .wrappers import MessageGenerator, new_method_call


class DBusNameFlags:
    allow_replacement = 1
    replace_existing = 2
    do_not_queue = 4

class DBus(MessageGenerator):
    interface = 'org.freedesktop.DBus'

    def __init__(self, object_path='/org/freedesktop/DBus',
                 bus_name='org.freedesktop.DBus'):
        super().__init__(object_path=object_path, bus_name=bus_name)

    def Hello(self):
        return new_method_call(self, 'Hello')

    def RequestName(self, name, flags=0):
        return new_method_call(self, 'RequestName', 'su', (name, flags))

    def ReleaseName(self, name):
        return new_method_call(self, 'ReleaseName', 's', (name,))

    def StartServiceByName(self, name):
        return new_method_call(self, 'StartServiceByName', 'su',
                               (name, 0))

    def UpdateActivationEnvironment(self, env):
        return new_method_call(self, 'UpdateActivationEnvironment', 'a{ss}',
                               (env,))

    def NameHasOwner(self, name):
        return new_method_call(self, 'NameHasOwner', 's', (name,))

    def ListNames(self):
        return new_method_call(self, 'ListNames')

    def ListActivatableNames(self):
        return new_method_call(self, 'ListActivatableNames')

    def AddMatch(self, rule):
        if isinstance(rule, MatchRule):
            rule = rule.serialise()
        return new_method_call(self, 'AddMatch', 's', (rule,))

    def RemoveMatch(self, rule):
        if isinstance(rule, MatchRule):
            rule = rule.serialise()
        return new_method_call(self, 'RemoveMatch', 's', (rule,))

    def GetNameOwner(self, name):
        return new_method_call(self, 'GetNameOwner', 's', (name,))

    def ListQueuedOwners(self, name):
        return new_method_call(self, 'ListQueuedOwners', 's', (name,))

    def GetConnectionUnixUser(self, name):
        return new_method_call(self, 'GetConnectionUnixUser', 's', (name,))

    def GetConnectionUnixProcessID(self, name):
        return new_method_call(self, 'GetConnectionUnixProcessID', 's', (name,))

    def GetAdtAuditSessionData(self, name):
        return new_method_call(self, 'GetAdtAuditSessionData', 's', (name,))

    def GetConnectionSELinuxSecurityContext(self, name):
        return new_method_call(self, 'GetConnectionSELinuxSecurityContext', 's',
                               (name,))

    def ReloadConfig(self):
        return new_method_call(self, 'ReloadConfig')

    def GetId(self):
        return new_method_call(self, 'GetId')

    def GetConnectionCredentials(self, name):
        return new_method_call(self, 'GetConnectionCredentials', 's', (name,))

message_bus = DBus()

class Monitoring(MessageGenerator):
    interface = 'org.freedesktop.DBus.Monitoring'

    def __init__(self, object_path='/org/freedesktop/DBus',
                 bus_name='org.freedesktop.DBus'):
        super().__init__(object_path=object_path, bus_name=bus_name)

    def BecomeMonitor(self, rules):
        return new_method_call(self, 'BecomeMonitor', 'asu', (rules, 0))

class Stats(MessageGenerator):
    interface = 'org.freedesktop.DBus.Debug.Stats'

    def __init__(self, object_path='/org/freedesktop/DBus',
                 bus_name='org.freedesktop.DBus'):
        super().__init__(object_path=object_path, bus_name=bus_name)

    def GetStats(self):
        return new_method_call(self, 'GetStats')

    def GetConnectionStats(self, arg0):
        return new_method_call(self, 'GetConnectionStats', 's',
                               (arg0,))

    def GetAllMatchRules(self):
        return new_method_call(self, 'GetAllMatchRules')


class MatchRule:
    """Construct a match rule to subscribe to DBus messages.
    
    e.g.::
    
        mr = MatchRule(interface='org.freedesktop.DBus', member='NameOwnerChanged',
                       type='signal')
        msg = add_match(mr)
        # Send this message to subscribe to the signal
    """
    def __init__(self, *, type=None, sender=None, interface=None, member=None,
                 path=None, path_namespace=None, destination=None,
                 eavesdrop=False):
        self.conditions = c ={}
        if type:
            c['type'] = type
        if sender:
            c['sender'] = sender
        if interface:
            c['interface'] = interface
        if member:
            c['member'] = member
        if path:
            c['path'] = path
        if path_namespace:
            c['path_namespace'] = path_namespace
        if destination:
            c['destination'] = destination
        if eavesdrop:
            c['eavesdrop'] = 'true'

    def add_arg_condition(self, argno, value, kind='string'):
        """Add a condition for a particular argument
        
        argno: int, 0-63
        kind: 'string', 'path', 'namespace'
        """
        if kind not in {'string', 'path', 'namespace'}:
            raise ValueError("kind={!r}".format(kind))
        if kind == 'namespace' and argno != 0:
            raise ValueError("argno must be 0 for kind='namespace'")
        if kind == 'string':
            kind = ''
        name = 'arg{}{}'.format(argno, kind)
        self.conditions[name] = value

    def serialise(self):
        parts = []
        for k, v in sorted(self.conditions.items()):
            parts.append('{}={}'.format(k, v.replace("'", r"\'")))
        return ','.join(parts)

