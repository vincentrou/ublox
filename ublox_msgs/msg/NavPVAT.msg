# NAV-PVAT (0x01 0x17)
# Navigation Position Velocity Attitude Time Solution
#
# Note that during a leap second there may be more (or less) than 60 seconds in
# a minute; see the description of leap seconds for details.
#
# This message combines Position, velocity, attitude and time solution in LLH,
# including accuracy figures
#
# WARNING: For firmware version 7, this message is a different length.
#

uint8 CLASS_ID = 1
uint8 MESSAGE_ID = 23

uint32 i_tow            # GPS Millisecond time of week [ms]
uint8 version           # Message version (0x00 for this version)

uint8 valid             # Validity flags
uint8 VALID_DATE = 1            # Valid UTC Date
uint8 VALID_TIME = 2            # Valid
uint8 VALID_FULLY_RESOLVED = 4  # UTC time of day has been fully resolved
                                # (no seconds uncertainty)
uint8 VALID_MAG = 8             # Valid Magnetic Declination

uint16 year             # Year (UTC)
uint8 month             # Month, range 1..12 (UTC)
uint8 day               # Day of month, range 1..31 (UTC)
uint8 hour              # Hour of day, range 0..23 (UTC)
uint8 min               # Minute of hour, range 0..59 (UTC)
uint8 sec               # Seconds of minute, range 0..60 (UTC)

uint8 reserved0
uint8[2] reserved1

uint32 t_acc            # time accuracy estimate [ns] (UTC)
int32 nano              # fraction of a second [ns], range -1e9 .. 1e9 (UTC)

uint8 fix_type           # GNSS fix Type, range 0..5
uint8 FIX_TYPE_NO_FIX = 0
uint8 FIX_TYPE_DEAD_RECKONING_ONLY = 1
uint8 FIX_TYPE_2D = 2                           # Signal from only 3 SVs,
                                                # constant altitude assumed
uint8 FIX_TYPE_3D = 3
uint8 FIX_TYPE_GNSS_DEAD_RECKONING_COMBINED = 4 # GNSS + Dead reckoning
uint8 FIX_TYPE_TIME_ONLY = 5                    # Time only fix (High precision
                                                # devices)

uint8 flags             # Fix Status Flags
uint8 FLAGS_GNSS_FIX_OK = 1          # i.e. within DOP & accuracy masks
uint8 FLAGS_DIFF_SOLN = 2            # DGPS used
uint8 FLAGS_PSM_MASK = 28            # Power Save Mode
uint8 FLAGS_ROLL_VEH_VALID = 8       # roll of vehicle is valid
uint8 FLAGS_PITCH_VEH_VALID = 16     # pitch of vehicle is valid
uint8 FLAGS_HEAD_VEH_VALID = 32      # heading of vehicle is valid
uint8 FLAGS_CARRIER_PHASE_MASK = 192 # Carrier Phase Range Solution Status
uint8 CARRIER_PHASE_NO_SOLUTION = 0     # no carrier phase range solution
uint8 CARRIER_PHASE_FLOAT = 64          # carrier phase float solution (no fixed
                                        # integer measurements have been used to
                                        # calculate the solution)
uint8 CARRIER_PHASE_FIXED = 128         # fixed solution (>=1 fixed integer
                                        # carrier phase range measurements have
                                        # been used to calculate  the solution)

uint8 flags2            # Additional Flags
uint8 FLAGS2_CONFIRMED_AVAILABLE = 32   # information about UTC Date and Time of
                                        # Day validity confirmation is available
uint8 FLAGS2_CONFIRMED_DATE = 64        # UTC Date validity could be confirmed
uint8 FLAGS2_CONFIRMED_TIME = 128       # UTC Time of Day could be confirmed

uint8 num_sv             # Number of SVs used in Nav Solution
int32 lon                # Longitude [deg / 1e-7]
int32 lat                # Latitude [deg / 1e-7]
int32 height             # Height above Ellipsoid [mm]
int32 h_msl              # Height above mean sea level [mm]
uint32 h_acc             # Horizontal Accuracy Estimate [mm]
uint32 v_acc             # Vertical Accuracy Estimate [mm]

int32 vel_n              # NED north velocity [mm/s]
int32 vel_e              # NED east velocity [mm/s]
int32 vel_d              # NED down velocity [mm/s]
int32 g_speed            # Ground Speed (2-D) [mm/s]
uint32 s_acc             # Speed Accuracy Estimate [mm/s]
int32 roll               # Vehicle roll [deg / 1e-5]
int32 pitch              # Vehicle pitch [deg / 1e-5]
int32 heading_vehicle    # Vehicle heading [deg / 1e-5]
int32 heading_motion     # Heading of motion 2-D [deg / 1e-5]
uint16 roll_acc          # Roll accuracy [deg / 1e-2]
uint16 pitch_acc         # Pitch accuracy [deg / 1e-2]
uint16 heading_acc       # Heading Accuracy Estimate (both motion & vehicle)
                         # [deg / 1e-2]
int16 mag_dec            # Magnetic declination [deg / 1e-2]
uint16 mag_acc           # Magnetic declination accuracy [deg / 1e-2]
uint16 ellipse_orient_err  # Orientation of semi-major axis of error ellipse (degrees from true north) [deg / 1e-2]
uint32 ellipse_major_err   # Semi-major axis of error ellipse [mm]
uint32 ellipse_minor_err   # Semi-minor axis of error ellipse [mm]
uint8[4] reserved2
uint8[4] reserved3
